import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_ms/core/utils/values_manager.dart';
import 'package:property_ms/features/offices_page/sub_pages/office_details/models/office_profile_model.dart';
import 'package:property_ms/features/offices_page/sub_pages/office_details/office_details_controller.dart';
import 'package:property_ms/features/offices_page/sub_pages/office_details/widgets/reusable/contact_card.dart';
import 'package:property_ms/features/offices_page/sub_pages/office_details/widgets/reusable/location_row.dart';
import 'package:property_ms/features/offices_page/sub_pages/office_details/widgets/reusable/section_label.dart';
import 'package:property_ms/features/offices_page/sub_pages/office_details/widgets/reusable/service_rating_row.dart';
import 'package:property_ms/features/offices_page/sub_pages/office_details/widgets/reusable/social_icons_row.dart';
import 'package:property_ms/features/offices_page/sub_pages/office_details/widgets/reusable/working_hours_row.dart';

class OfficeProfileTab extends GetView<OfficeDetailsController> {
  const OfficeProfileTab({super.key, required this.model});

  final OfficeProfileModel model;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: AppPadding.p24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: AppSize.s24),

            const SectionLabel(title: 'نشاط المكتب'),
            ServiceRatingRow(serviceType: model.serviceType, rate: model.rate),

            const SizedBox(height: AppSize.s24),
            const SectionLabel(title: 'الموقع:'),
            const SizedBox(height: AppSize.s8),
            LocationRow(location: model.location),

            const SizedBox(height: AppSize.s24),
            const SectionLabel(title: 'أوقات الدوام :'),
            const SizedBox(height: AppSize.s8),
            WorkingHoursRow(startTime: model.startWork, endTime: model.endWork),

            const SizedBox(height: AppSize.s24),
            const SectionLabel(title: 'تواصل مع المكتب:'),
            const SizedBox(height: AppSize.s16),
            const SocialIconsRow(
              instagramUrl: 'https://www.instagram.com/flutter.dev/',
              whatsappUrl: 'https://wa.me/0988861119', // WhatsApp test number
              facebookUrl: 'https://www.facebook.com/fluttercommunity',
            ),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: ContactCard(phoneNumber: model.officeNumber, name: model.title),
      ),
    );
  }
}
