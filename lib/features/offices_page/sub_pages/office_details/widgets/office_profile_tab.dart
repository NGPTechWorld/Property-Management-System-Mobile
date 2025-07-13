import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:property_ms/core/utils/assets.gen.dart';
import 'package:property_ms/core/utils/values_manager.dart';
import 'package:property_ms/features/offices_page/sub_pages/office_details/models/office_profile_model.dart';
import 'package:property_ms/features/offices_page/sub_pages/office_details/office_details_controller.dart';
import 'package:property_ms/features/offices_page/sub_pages/office_details/widgets/reusable/contact_card.dart';
import 'package:property_ms/features/offices_page/sub_pages/office_details/widgets/reusable/info_card.dart';
import 'package:property_ms/features/offices_page/sub_pages/office_details/widgets/reusable/lacation_card.dart';
import 'package:property_ms/features/offices_page/sub_pages/office_details/widgets/reusable/map_button.dart';
import 'package:property_ms/features/offices_page/sub_pages/office_details/widgets/reusable/section_label.dart';
import 'package:property_ms/features/offices_page/sub_pages/office_details/widgets/reusable/service_type_chip.dart';
import 'package:property_ms/features/offices_page/sub_pages/office_details/widgets/reusable/time_card.dart';

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

            //! 1 Row: Service Type and Rating
            const SectionLabel(title: 'نشاط المكتب'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InfoCard(
                  title: 'نوع الخدمة',
                  child: ServiceTypeChip(label: model.serviceType),
                ),
                const SizedBox(width: AppSize.s16),
                GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder:
                          (_) => AlertDialog(
                            title: const Text('قيّم هذا المكتب'),
                            content: RatingBar.builder(
                              initialRating: double.tryParse(model.rate) ?? 0,
                              minRating: 1,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemCount: 5,
                              itemPadding: const EdgeInsets.symmetric(
                                horizontal: 4.0,
                              ),
                              itemBuilder:
                                  (context, _) => const Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  ),
                              onRatingUpdate: (rating) {
                                print('New rating: $rating');
                              },
                            ),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.of(context).pop(),
                                child: const Text('إغلاق'),
                              ),
                            ],
                          ),
                    );
                  },
                  child: InfoCard(
                    title: 'التقييم',
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          model.rate,
                          style: TextStyle(
                            fontSize: FontSize.s20,
                            fontWeight: FontWeight.bold,
                            color: const Color(0xFF3F3D56),
                          ),
                        ),
                        const SizedBox(width: 6),
                        const Icon(
                          Icons.star,
                          color: Colors.amber,
                          size: AppSize.s24,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: AppSize.s24),

            //! 2 Location Section
            const SectionLabel(title: 'الموقع:'),
            const SizedBox(height: AppSize.s8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                LocationCard(loctation: model.location),
                const MapButton(),
              ],
            ),

            const SizedBox(height: AppSize.s24),

            //! 3 Working Hours
            const SectionLabel(title: 'أوقات الدوام :'),
            const SizedBox(height: AppSize.s8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TimeCard(time: model.startWork, period: 'صباحاً'),
                Text(
                  'إلى',
                  style: Get.textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TimeCard(time: model.endWork, period: 'مساءً'),
              ],
            ),

            const SizedBox(height: AppSize.s24),

            //! 4 Social Icons
            const SectionLabel(title: 'تواصل مع المكتب:'),
            const SizedBox(height: AppSize.s16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Assets.icons.insta.svg(height: AppSize.s34),
                Assets.icons.whatsapp.svg(height: AppSize.s34),
                Assets.icons.facebook.svg(height: AppSize.s34),
              ],
            ),
            // const SizedBox(height: AppSize.s12),
          ],
        ),
      ),

      bottomNavigationBar: SafeArea(
        child: ContactCard(phoneNumber: model.officeNumber, name: model.title),
      ),
    );
  }
}
