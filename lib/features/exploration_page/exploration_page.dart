import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:property_ms/core/utils/widgets/normal_app_bar.dart';
import 'package:property_ms/data/enums/loading_state_enum.dart';
import 'package:property_ms/features/widgets/tourisem_card_small.dart';

import 'exploration_controller.dart';

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
              initialCenter: LatLng(controller.lat, controller.lng),
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
          Obx(() {
            if (controller.isLoadingDetail.value) {
              return const Positioned(
                bottom: 100,
                left: 16,
                right: 16,
                child: Center(child: CircularProgressIndicator()),
              );
            }

            if (controller.selectedProperty.value != null) {
              return Positioned(
                bottom: 48,
                left: 16,
                right: 5,

                child: TourisemCardSmall(
                  model:
                      controller
                          .selectedProperty
                          .value!
                          .sellDetails!
                          .sellingPrice,
                ),
              );
            }

            if (controller.selectedTourism.value != null) {
              return Positioned(
                bottom: 48,
                left: 16,
                right: 5,
                child: TourisemCardSmall(
                  model: controller.selectedTourism.value!,
                ), // create a TourismCard
              );
            }
            if (controller.selectedOffice.value != null) {
              return Positioned(
                bottom: 48,
                left: 16,
                right: 5,
                child: TourisemCardSmall(
                  model: controller.selectedOffice.value!,
                ), // create a selectedOffice
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
