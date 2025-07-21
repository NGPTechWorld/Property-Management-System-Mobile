import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_ms/features/offices_page/sub_pages/office_details/widgets/all_office_properties_tab.dart';
import 'package:property_ms/features/offices_page/sub_pages/office_details/widgets/office_app_bar.dart';
import 'package:property_ms/features/offices_page/sub_pages/office_details/widgets/office_profile_tab.dart';
import 'package:property_ms/features/widgets/office_profile_reusable_widgets/image_with_title_section.dart';
import 'package:property_ms/features/widgets/office_profile_reusable_widgets/tab/tab_body.dart';
import 'package:property_ms/features/widgets/office_profile_reusable_widgets/tab/tab_title.dart';
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
          TabBody(
            tabController: controller.tabController,
            children: [
              const AllOfficePropertiesTab(),
              OfficeProfileTab(model: controller.officeProfileModel),
            ],
          ),
        ],
      ),
    );
  }
}
