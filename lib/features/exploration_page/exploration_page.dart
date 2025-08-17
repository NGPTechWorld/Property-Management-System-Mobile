import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:property_ms/data/enums/loading_state_enum.dart';
import 'exploration_controller.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:property_ms/core/utils/widgets/normal_app_bar.dart';

class ExplorationPage extends GetView<ExplorationController> {
  const ExplorationPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ExplorationController());
    return Scaffold(
      appBar: const NormalAppBar(title: "إستكشاف"),
      body: Stack(
        children: [
          FlutterMap(
            mapController: controller.mapController,
            options: MapOptions(
              initialCenter: const LatLng(33.5138, 36.2765), // دمشق
              initialZoom: 13.0,
              onPositionChanged: (position, hasGesture) {
                if (hasGesture) controller.onMapMoved();
              },
            ),
            children: [
              TileLayer(
                urlTemplate:
                    'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                userAgentPackageName: 'com.example.property_ms',
              ),
              Obx(() => MarkerLayer(markers: controller.markerList.toList())),
            ],
          ),
          Obx(() {
            if (controller.loadingState.value == LoadingState.loading) {
              return Container(
                color: Colors.black38,
                child: const Center(child: CircularProgressIndicator()),
              );
            }
            return const SizedBox.shrink();
          }),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => controller.goToUserLocation(),
        child: const Icon(Icons.my_location),
      ),
    );
  }
}
