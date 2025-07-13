import 'dart:developer';

import 'package:get/get.dart';
import 'package:flutter/material.dart';
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
      body: FlutterMap(
        mapController: controller.mapController,
        options: MapOptions(
          initialCenter: const LatLng(33.5138, 36.2765), // دمشق
          initialZoom: 13.0,
          onPositionChanged: (position, hasGesture) {
            log("test");
          },
        ),
        children: [
          TileLayer(
            urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
            // subdomains: const ['a', 'b', 'c'],
            userAgentPackageName: 'com.example.property_ms',
          ),
          Obx(() => MarkerLayer(markers: controller.markerList.toList())),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => controller.goToUserLocation(),
        child: const Icon(Icons.my_location),
      ),
    );
  }
}
