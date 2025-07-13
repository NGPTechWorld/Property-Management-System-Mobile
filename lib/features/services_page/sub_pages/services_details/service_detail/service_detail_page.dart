import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_ms/core/utils/assets.gen.dart';
import 'package:property_ms/core/utils/values_manager.dart';
import 'package:property_ms/features/offices_page/sub_pages/office_details/widgets/office_app_bar.dart';
import 'package:property_ms/features/offices_page/sub_pages/office_details/widgets/reusable/contact_card.dart';
import 'package:property_ms/features/offices_page/sub_pages/office_details/widgets/reusable/image_with_title_section.dart';
import 'package:property_ms/features/offices_page/sub_pages/office_details/widgets/reusable/lacation_card.dart';
import 'package:property_ms/features/offices_page/sub_pages/office_details/widgets/reusable/section_label.dart';
import 'package:property_ms/features/offices_page/sub_pages/office_details/widgets/reusable/service_rating_row.dart';
import 'package:property_ms/features/offices_page/sub_pages/office_details/widgets/reusable/social_icons_row.dart';
import 'package:property_ms/features/offices_page/sub_pages/office_details/widgets/reusable/working_hours_row.dart';

import './service_detail_controller.dart';

class ServiceDetailPage extends GetView<ServiceDetailController> {
  const ServiceDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const OfficeAppBar(),
      body: Column(
        children: [
          // Fixed image section
          ImageWithTitleSection(
            image: Assets.images.propertyCard.image().image,
            title: 'المصور علي',
          ),

          // Scrollable content
          const Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.only(bottom: AppPadding.p24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: AppSize.s24),
                  SectionLabel(title: 'تفاصيل الخدمة'),
                  ServiceRatingRow(serviceType: 'test', rate: '3.5'),
                  SizedBox(height: AppSize.s24),
                  LocationCard(loctation: 'loctation'),
                  SizedBox(height: AppSize.s24),
                  SectionLabel(title: 'أوقات الدوام :'),
                  SizedBox(height: AppSize.s8),
                  WorkingHoursRow(startTime: '10:30', endTime: '10:30'),
                  SizedBox(height: AppSize.s24),
                  SectionLabel(title: 'تواصل مع المكتب:'),
                  SizedBox(height: AppSize.s16),
                  SocialIconsRow(
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
        child: ContactCard(phoneNumber: '0987654321', name: 'name'),
      ),
    );
  }
}
