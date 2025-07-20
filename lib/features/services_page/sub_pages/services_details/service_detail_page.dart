import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_ms/core/routes/app_routes.dart';
import 'package:property_ms/core/utils/assets.gen.dart';
import 'package:property_ms/core/utils/color_manager.dart';
import 'package:property_ms/core/utils/values_manager.dart';
import 'package:property_ms/features/offices_page/sub_pages/office_details/widgets/reusable/contact_card.dart';
import 'package:property_ms/features/offices_page/sub_pages/office_details/widgets/reusable/image_with_title_section.dart';
import 'package:property_ms/features/offices_page/sub_pages/office_details/widgets/reusable/lacation_card.dart';
import 'package:property_ms/features/offices_page/sub_pages/office_details/widgets/reusable/section_label.dart';
import 'package:property_ms/features/offices_page/sub_pages/office_details/widgets/reusable/service_rating_row.dart';
import 'package:property_ms/features/offices_page/sub_pages/office_details/widgets/reusable/social_icons_row.dart';
import 'package:property_ms/features/offices_page/sub_pages/office_details/widgets/reusable/working_hours_row.dart';

import 'service_detail_controller.dart';

class ServiceDetailPage extends GetView<ServiceDetailController> {
  const ServiceDetailPage({super.key});
  //! @OsamaZerkawi Create Model here
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
                Get.toNamed(AppRoutes.reportServicePage);
              } else if (value == 'الإعدادات') {
                showDialog(
                  context: context,
                  builder:
                      (context) => AlertDialog(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        title: const Text('الإعدادات'),
                        content: const Text('قيد التطوير   🚀🚀'),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text('إغلاق'),
                          ),
                        ],
                      ),
                );
              }
            },
            itemBuilder:
                (context) => [
                  const PopupMenuItem(
                    value: 'الإعدادات',
                    child: Row(
                      children: [
                        Icon(Icons.settings, color: Colors.black54),
                        SizedBox(width: 8),
                        Text('الإعدادات'),
                      ],
                    ),
                  ),
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
      body: Column(
        children: [
          // Fixed image section
          ImageWithTitleSection(
            image: Assets.images.propertyCard.image().image,
            title: 'المصور علي',
          ),

          // Scrollable content
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.only(bottom: AppPadding.p24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: AppSize.s24),
                  const SectionLabel(title: 'تفاصيل الخدمة'),
                  const ServiceDescription(),
                  const SizedBox(height: AppSize.s24),
                  Obx(
                    () => ServiceRatingRow(
                      serviceType: 'test',
                      rate: controller.rating.value.toString(),
                      onRatingChanged: (newRating) {
                        controller.updateOfficeRating(newRating);
                      },
                    ),
                  ),
                  const SizedBox(height: AppSize.s24),
                  const SectionLabel(title: 'الموقع'),
                  const ServiceLocation(),
                  const SizedBox(height: AppSize.s24),
                  const SectionLabel(title: 'أوقات الدوام :'),
                  const SizedBox(height: AppSize.s8),
                  const WorkingHoursRow(startTime: '10:30', endTime: '10:30'),
                  const SizedBox(height: AppSize.s24),
                  const SectionLabel(title: 'تواصل مع المكتب:'),
                  const SizedBox(height: AppSize.s16),
                  const SocialIconsRow(
                    instagramUrl: 'https://www.instagram.com/flutter.dev/',
                    whatsappUrl: 'https://wa.me/0988861119',
                    facebookUrl: 'https://www.facebook.com/fluttercommunity',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: const SafeArea(
        child: ContactCard(phoneNumber: '0987654321', name: 'المصور علي 2'),
      ),
    );
  }
}

class ServiceLocation extends StatelessWidget {
  const ServiceLocation({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: AppSize.sWidth * .80,
        height: AppSize.s90,
        child: const LocationCard(
          location: 'دمشق ميدان',
          direction: Axis.horizontal,
          spacing: AppPadding.p50,
          iconSize: 48,
        ),
      ),
    );
  }
}

class ServiceDescription extends StatelessWidget {
  const ServiceDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppPadding.p16,
        vertical: AppPadding.p8,
      ),
      child: Text(
        'هذه الخدمة تقدم تصويراً احترافياً للعقارات مع إضاءة متقنة وزوايا تصوير مميزة لعرض العقار بأفضل صورة. نستخدم أحدث المعدات والتقنيات لضمان جودة عالية.',
        style: Get.textTheme.bodyMedium?.copyWith(
          color: ColorManager.textColor1,
          height: 1.7,
        ),
      ),
    );
  }
}
