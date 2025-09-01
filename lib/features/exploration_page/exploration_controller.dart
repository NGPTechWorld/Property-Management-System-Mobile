import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:property_ms/core/utils/assets.gen.dart';
import 'package:property_ms/core/utils/widgets/custom_toasts.dart';
import 'package:property_ms/data/dto/office_dto.dart';
import 'package:property_ms/data/dto/property_dto.dart';
import 'package:property_ms/data/dto/tourism_dto.dart';
import 'package:property_ms/data/enums/loading_state_enum.dart';
import 'package:property_ms/data/models/marker_model.dart';
import 'package:property_ms/data/repos/map_repositories.dart';

class ExplorationController extends GetxController {
  final MapRepositories mapRepo = Get.find<MapRepositories>();

  final markerModlesList = <MarkerModel>[].obs;
  final markerList = <Marker>[].obs;
  final loadingState = LoadingState.idle.obs;
  final mapController = MapController();
  double lat = 33.5138; // دمشق
  double lng = 36.2765;
  Timer? _debounce;

  var selectedProperty = Rxn<PropertyDto>();
  var selectedTourism = Rxn<TourismDto>();
  var selectedOffice = Rxn<OfficeDto>();
  var isLoadingDetail = false.obs;

  @override
  void onInit() {
    lat = Get.arguments?['lat'] ?? lat;
    lng = Get.arguments?['lng'] ?? lng;
    super.onInit();
    Future.delayed(const Duration(milliseconds: 300), () {
      exploreInView();
    });
  }

  Future<void> exploreInView() async {
    final bounds = mapController.camera.visibleBounds;

    final southWest = bounds.southWest;
    final northEast = bounds.northEast;

    final minLat = southWest.latitude;
    final maxLat = northEast.latitude;
    final minLng = southWest.longitude;
    final maxLng = northEast.longitude;

    await explore(minLat, maxLat, minLng, maxLng);

    markerList.clear();
    markerList.addAll(
      markerModlesList.map(
        (e) => Marker(
          width: 60,
          height: 60,
          point: LatLng(e.lat, e.lng),
          child: GestureDetector(
            onTap: () => fetchMarkerDetails(e),
            child:
                e.type == "عقاري"
                    ? Assets.icons.markerProperty.svg(width: 40)
                    : e.type == "سياحي"
                    ? Assets.icons.markerTourisem.svg(width: 40)
                    : Assets.icons.markerOffice.svg(width: 40),
          ),
        ),
      ),
    );
  }

  Future<void> explore(
    double minLat,
    double maxLat,
    double minLng,
    double maxLng,
  ) async {
    if (loadingState.value == LoadingState.loading) return;

    loadingState.value = LoadingState.loading;

    try {
      final response = await mapRepo.explore(
        minLat: minLat,
        maxLat: maxLat,
        minLng: minLng,
        maxLng: maxLng,
      );

      if (!response.success) {
        loadingState.value = LoadingState.hasError;
        CustomToasts(
          message: response.getErrorMessage(),
          type: CustomToastType.error,
        ).show();
        return;
      }

      markerModlesList.clear();
      markerModlesList.addAll(response.data ?? []);

      loadingState.value =
          markerModlesList.isEmpty
              ? LoadingState.doneWithNoData
              : LoadingState.doneWithData;
    } catch (e) {
      loadingState.value = LoadingState.hasError;
      const CustomToasts(
        message: "خطأ بالاتصال",
        type: CustomToastType.error,
      ).show();
    }
  }

  void onMapMoved() {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      exploreInView();
    });
  }

  Future<void> goToUserLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      Get.snackbar("خطأ", "خدمة الموقع غير مفعلة");
      await Geolocator.openLocationSettings();
      return;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        Get.snackbar("رفض الصلاحية", "لم يتم منح صلاحية الوصول للموقع");
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      Get.snackbar("مرفوض نهائياً", "اذهب للإعدادات وفعّل صلاحية الموقع");
      await Geolocator.openAppSettings();
      return;
    }

    Position position = await Geolocator.getCurrentPosition();
    final currentLatLng = LatLng(position.latitude, position.longitude);

    mapController.move(currentLatLng, 17);

    markerList.add(
      Marker(
        width: 60,
        height: 60,
        point: currentLatLng,
        child: const Icon(Icons.location_pin, color: Colors.orange, size: 40),
      ),
    );

    log('📍 الموقع الحالي: ${position.latitude}, ${position.longitude}');
  }

  Future<void> fetchMarkerDetails(MarkerModel marker) async {
    isLoadingDetail.value = true;
    await Future.delayed(const Duration(milliseconds: 200));
    try {
      if (marker.type == "عقاري") {
        selectedProperty.value = PropertyDto.fromJson(marker.card!);
        selectedTourism.value = null;
        selectedOffice.value = null;
      } else if (marker.type == "سياحي") {
        selectedTourism.value = TourismDto.fromJson(marker.card!);
        selectedProperty.value = null;
        selectedOffice.value = null;
      } else {
        selectedOffice.value = OfficeDto.fromJson(marker.card!);
        selectedProperty.value = null;
        selectedTourism.value = null;
      }
    } catch (e) {
      const CustomToasts(
        message: 'تعذر جلب بيانات الموقع',
        type: CustomToastType.error,
      ).show();
    } finally {
      isLoadingDetail.value = false;
    }
  }
}
