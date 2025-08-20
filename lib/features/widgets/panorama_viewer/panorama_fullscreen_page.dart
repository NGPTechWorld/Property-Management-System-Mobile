// panorama_fullscreen_page.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:panorama_viewer/panorama_viewer.dart' as pv;

import 'panorama_ui_controller.dart';

class PanoramaFullscreenPage extends StatelessWidget {
  final String imageUrl;
  const PanoramaFullscreenPage({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    final c = Get.put(PanoramaUiController());

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Obx(() {
            return pv.PanoramaViewer(
              zoom: 0.5,
              minZoom: 0.3,
              maxZoom: 5.0,
              animSpeed: 0.0,
              sensorControl: c.sensorControl.value,
              panoramaController: c.pano,
              child: Image.network(
                imageUrl,
                fit: BoxFit.fill,
              ), // enables setZoom/setView/etc.
            );
          }),

          // Close
          Positioned(
            top: 40,
            left: 16,
            child: IconButton(
              icon: const Icon(Icons.close, color: Colors.white, size: 32),
              onPressed: () => Get.back(),
            ),
          ),

          // Controls
          Positioned(
            bottom: 32,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _Btn(icon: Icons.zoom_out, onTap: c.zoomOut),
                const SizedBox(width: 16),
                _Btn(icon: Icons.zoom_in, onTap: c.zoomIn),
                const SizedBox(width: 16),
                Obx(
                  () => _Btn(
                    icon: Icons.screen_rotation,
                    color:
                        c.sensorControl.value == pv.SensorControl.orientation
                            ? Colors.green
                            : Colors.white,
                    onTap: c.toggleGyroscope,
                  ),
                ),
                const SizedBox(width: 16),
                _Btn(icon: Icons.refresh, onTap: c.resetView),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Btn extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  final Color color;
  const _Btn({
    required this.icon,
    required this.onTap,
    this.color = Colors.white,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        radius: 28,
        backgroundColor: Colors.black54,
        child: Icon(icon, color: color, size: 28),
      ),
    );
  }
}
