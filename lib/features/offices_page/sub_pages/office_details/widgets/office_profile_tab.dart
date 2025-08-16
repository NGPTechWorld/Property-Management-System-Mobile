import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_ms/core/utils/values_manager.dart';
import 'package:property_ms/features/offices_page/sub_pages/office_details/office_details_controller.dart';
import 'package:property_ms/features/widgets/office_profile_reusable_widgets/contact_card.dart';
import 'package:property_ms/features/widgets/office_profile_reusable_widgets/location_row.dart';
import 'package:property_ms/features/widgets/office_profile_reusable_widgets/section_label.dart';
import 'package:property_ms/features/widgets/office_profile_reusable_widgets/service_rating_row.dart';
import 'package:property_ms/features/widgets/office_profile_reusable_widgets/social_icons_row.dart';
import 'package:property_ms/features/widgets/office_profile_reusable_widgets/working_hours_row.dart';

class OfficeProfileTab extends GetView<OfficeDetailsController> {
  const OfficeProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          await controller.refreshOfficeProfile();
        },
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: const EdgeInsets.only(bottom: AppPadding.p24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: AppSize.s24),

              const SectionLabel(title: 'نشاط المكتب'),
              Obx(
                () => ServiceRatingRow(
                  serviceType: controller.officeModel!.type,
                  rate: controller.rating.value.toString(),
                  onRatingChanged: (newRating) {
                    controller.updateRating(newRating);
                  },
                ),
              ),
              const SizedBox(height: AppSize.s24),
              const SectionLabel(title: 'الموقع:'),
              const SizedBox(height: AppSize.s8),
              LocationRow(location: controller.officeModel!.location),

              const SizedBox(height: AppSize.s24),
              const SectionLabel(title: 'أوقات الدوام :'),
              const SizedBox(height: AppSize.s8),
              WorkingHoursRow(
                startTime: controller.officeModel!.openingTime,
                endTime: controller.officeModel!.closingTime,
              ),

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
      ),
      bottomNavigationBar: SafeArea(
        child: ContactCard(
          phoneNumber: controller.officeModel!.phone,
          name: controller.officeModel!.name,
        ),
      ),
    );
  }
}
