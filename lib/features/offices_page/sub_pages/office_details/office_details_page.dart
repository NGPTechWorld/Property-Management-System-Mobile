import 'package:flutter/material.dart';
import 'package:get/get.dart';

import './office_details_controller.dart';

class OfficeDetailsPage extends GetView<OfficeDetailsController> {
  const OfficeDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('OfficeDetailsPage')),
      body: Container(child: Text('${controller.office.title}')),
    );
  }
}
