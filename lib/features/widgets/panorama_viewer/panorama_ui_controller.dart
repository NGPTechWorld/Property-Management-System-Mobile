// panorama_ui_controller.dart
import 'package:get/get.dart';
import 'package:panorama_viewer/panorama_viewer.dart' as pv;

class PanoramaUiController extends GetxController {
  // sensor control (gyro)
  final sensorControl = pv.SensorControl.none.obs;

  // package controller for programmatic control (zoom, view, anim)
  final pano = pv.PanoramaController();

  void toggleGyroscope() {
    sensorControl.value =
        sensorControl.value == pv.SensorControl.none
            ? pv.SensorControl.orientation
            : pv.SensorControl.none;
  }

  void zoomIn() {
    final z = pano.getZoom();
    final next = (z + 0.2).clamp(1.0, 5.0);
    pano.setZoom(next);
  }

  void zoomOut() {
    final z = pano.getZoom();
    final next = (z - 0.2).clamp(1.0, 5.0);
    pano.setZoom(next);
  }

  void resetView() {
    pano.setZoom(1.0);
    pano.setView(0.0, 0.0); // latitude, longitude
    pano.setAnimSpeed(0.0);
  }
}
