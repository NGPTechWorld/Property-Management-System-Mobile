import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'offices_controller.dart';

class OfficesPage extends GetView<OfficesController> {
    
    const OfficesPage({super.key});

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(title: const Text('OfficesPage'),),
            body: Container(),
        );
    }
}