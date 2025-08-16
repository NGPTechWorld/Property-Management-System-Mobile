import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_ms/core/routes/app_routes.dart';
import 'package:property_ms/core/utils/color_manager.dart';
import 'package:property_ms/core/utils/values_manager.dart';
import 'package:property_ms/data/enums/loading_state_enum.dart';
import 'package:property_ms/features/services_page/sub_pages/services_details/service_detail_controller.dart';
import 'package:property_ms/features/widgets/office_profile_reusable_widgets/contact_card.dart';
import 'package:property_ms/features/widgets/office_profile_reusable_widgets/image_with_title_section.dart';
import 'package:property_ms/features/widgets/office_profile_reusable_widgets/lacation_card.dart';
import 'package:property_ms/features/widgets/office_profile_reusable_widgets/section_label.dart';
import 'package:property_ms/features/widgets/office_profile_reusable_widgets/service_rating_row.dart';
import 'package:property_ms/features/widgets/office_profile_reusable_widgets/working_hours_row.dart';

class ServiceDetailPage extends GetView<ServiceDetailController> {
  const ServiceDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: ColorManager.lightPrimaryColor,
        actions: [
          PopupMenuButton<String>(
            icon: const Icon(Icons.more_vert),
            elevation: 8,
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            onSelected: (value) {
              if (value == 'إبلاغ') {
                Get.toNamed(
                  AppRoutes.reportServicePage,
                  arguments: controller.id,
                );
              }
            },
            itemBuilder:
                (context) => [
                  const PopupMenuItem(
                    value: 'إبلاغ',
                    child: Row(
                      children: [
                        Icon(Icons.info_outline, color: Colors.black54),
                        SizedBox(width: 8),
                        Text('إبلاغ'),
                      ],
                    ),
                  ),
                ],
          ),
        ],
      ),
      body: Obx(
        () =>
            controller.loadingState.value == LoadingState.loading
                ? const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [Center(child: CircularProgressIndicator())],
                )
                : controller.loadingState.value == LoadingState.doneWithData
                ? Stack(
                  children: [
                    RefreshIndicator(
                      onRefresh: () async {
                        await controller.refreshPage();
                      },
                      child: SingleChildScrollView(
                        physics: const AlwaysScrollableScrollPhysics(),
                        child: Column(
                          children: [
                            // Fixed image section
                            ImageWithTitleSection(
                              image: controller.serviceDetaitModel!.logo,
                              title: controller.serviceDetaitModel!.name,
                            ),

                            // Scrollable content
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: AppSize.s24),
                                const SectionLabel(title: 'تفاصيل الخدمة'),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: AppPadding.p16,
                                    vertical: AppPadding.p8,
                                  ),
                                  child: Text(
                                    controller.serviceDetaitModel!.details,
                                    style: Get.textTheme.bodyMedium?.copyWith(
                                      color: ColorManager.textColor1,
                                      height: 1.7,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: AppSize.s24),
                                Obx(
                                  () => ServiceRatingRow(
                                    serviceType:
                                        controller.serviceDetaitModel!.career,
                                    rate: controller.rating.value.toString(),
                                    onRatingChanged: controller.updateRating,
                                  ),
                                ),
                                const SizedBox(height: AppSize.s24),
                                const SectionLabel(title: 'الموقع'),
                                Center(
                                  child: SizedBox(
                                    width: AppSize.sWidth * .80,
                                    height: AppSize.s90,
                                    child: LocationCard(
                                      location:
                                          controller
                                              .serviceDetaitModel!
                                              .location,
                                      direction: Axis.horizontal,
                                      spacing: AppPadding.p50,
                                      iconSize: 48,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: AppSize.s24),
                                const SectionLabel(title: 'أوقات الدوام :'),
                                const SizedBox(height: AppSize.s8),
                                WorkingHoursRow(
                                  startTime:
                                      controller
                                          .serviceDetaitModel!
                                          .openingTime,
                                  endTime:
                                      controller
                                          .serviceDetaitModel!
                                          .closingTime,
                                ),
                                const SizedBox(height: AppSize.s24),
                                const SectionLabel(title: 'تواصل مع المكتب:'),
                                const SizedBox(height: AppSize.s16),
                                // SocialIconsRow(
                                //   instagramUrl: service.,
                                //   whatsappUrl: service.whatsappUrl,
                                //   facebookUrl: service.facebookUrl,
                                // ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: ContactCard(
                        phoneNumber: controller.serviceDetaitModel!.userPhone,
                        name: controller.serviceDetaitModel!.name,
                      ),
                    ),
                  ],
                )
                : Container(),
      ),
    );
  }
}
