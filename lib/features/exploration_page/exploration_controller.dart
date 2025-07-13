import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

class ExplorationController extends GetxController {
  final mapController = MapController();
  final markerList =
      <Marker>[
        Marker(
          width: 80.0,
          height: 80.0,
          point: LatLng(33.5138, 36.2765),
          child: Icon(Icons.location_pin, color: Colors.red, size: 40),
        ),
      ].obs;
  void fetchMarkersInView() {
    final bounds = mapController.camera.visibleBounds;

    final southWest = bounds.southWest;
    final northEast = bounds.northEast;

    final minLat = southWest.latitude;
    final maxLat = northEast.latitude;
    final minLng = southWest.longitude;
    final maxLng = northEast.longitude;
    log('Fetching markers between:');
    log('Lat: $minLat - $maxLat');
    log('Lng: $minLng - $maxLng');
  }

  void fetchMarkersInBounds(
    double minLat,
    double maxLat,
    double minLng,
    double maxLng,
  ) async {}

  Future<void> goToUserLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      Get.snackbar("خطأ", "خدمة الموقع غير مفعلة");
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
      return;
    }

    Position position = await Geolocator.getCurrentPosition();
    final currentLatLng = LatLng(position.latitude, position.longitude);
    markerList.add(
      Marker(
        width: 60,
        height: 60,
        point: currentLatLng,
        child: const Icon(Icons.location_pin, color: Colors.red, size: 40),
      ),
    );
    mapController.move(currentLatLng, 17);

    log('الموقع الحالي: ${position.latitude}, ${position.longitude}');
  }
}
