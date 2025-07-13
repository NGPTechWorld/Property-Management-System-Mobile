import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_ms/features/offices_page/sub_pages/office_details/widgets/office_app_bar.dart';
import 'package:property_ms/features/offices_page/sub_pages/office_details/widgets/reusable/image_with_title_section.dart';
import 'package:property_ms/features/offices_page/sub_pages/office_details/widgets/reusable/tab_body.dart';
import 'package:property_ms/features/offices_page/sub_pages/office_details/widgets/reusable/tab_title.dart';

import './office_details_controller.dart';

class OfficeDetailsPage extends GetView<OfficeDetailsController> {
  const OfficeDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const OfficeAppBar(),
      body: Column(
        children: [
          ImageWithTitleSection(
            image: controller.office.image.image().image,
            title: controller.office.title,
          ),
          TabTitle(
            tabs: controller.tabs,
            tabController: controller.tabController,
          ),
          TabBody(tabController: controller.tabController),
        ],
      ),
    );
  }
}
