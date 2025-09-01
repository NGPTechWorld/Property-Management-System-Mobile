import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_ms/data/enums/loading_state_enum.dart';
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
    if (Get.isRegistered<OfficeDetailsController>()) {
      Get.delete<OfficeDetailsController>();
    }
    Get.put(OfficeDetailsController());

    return Scaffold(
      appBar: const OfficeAppBar(),
      body: Obx(
        () =>
            controller.loadingState.value == LoadingState.loading
                ? const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [Center(child: CircularProgressIndicator())],
                )
                : controller.loadingState.value == LoadingState.doneWithData
                ? Column(
                  children: [
                    ImageWithTitleSection(
                      image: controller.officeModel!.logo,
                      title: controller.officeModel!.name,
                    ),
                    TabTitle(
                      tabs: controller.tabs,
                      tabController: controller.tabController,
                    ),
                    TabBody(
                      tabController: controller.tabController,
                      children: const [
                        AllOfficePropertiesTab(),
                        OfficeProfileTab(),
                      ],
                    ),
                  ],
                )
                : Container(),
      ),
    );
  }
}
