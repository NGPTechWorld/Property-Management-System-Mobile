import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'reservation_controller.dart';

class ReservationPage extends GetView<ReservationController> {
    
    const ReservationPage({super.key});

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(title: const Text('ReservationPage'),),
            body: Container(),
        );
    }
}