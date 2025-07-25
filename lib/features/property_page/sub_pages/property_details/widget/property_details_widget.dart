import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_ms/core/utils/color_manager.dart';
import 'package:property_ms/core/utils/values_manager.dart';
import 'package:property_ms/data/models/property_model.dart';
import 'package:property_ms/features/property_page/sub_pages/property_details/property_details_controller.dart';
import 'package:property_ms/features/widgets/office_profile_reusable_widgets/rating_card.dart';
import 'package:property_ms/features/widgets/property_reusable_widget/details_container.dart';

class PropertyDetailsWidget extends StatelessWidget {
  final PropertyModel model;

  const PropertyDetailsWidget({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: AppSize.s24),
        Text(
          'وصف العقار',
          style: Get.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          model.postDescription,
          style: Get.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
            color: ColorManager.grey3,
          ),
        ),
        const SizedBox(height: AppSize.s24),
        Text(
          'تفاصيل العقار',
          style: Get.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),

        model.listingType == "بيع"
            ? DetailsContainer(
              details: [
                DetailItem(
                  label: "المساحة",
                  value: model.area.toStringAsFixed(2),
                  icon: Icons.square_foot,
                ),
                DetailItem(
                  label: "نوع الملكية",
                  value: model.ownershipType,
                  icon: Icons.home_work_outlined,
                ),
                DetailItem(
                  label: "الجهة",
                  value: model.direction,
                  icon: Icons.explore,
                ),
                DetailItem(
                  label: "الفرش",
                  value: model.hasFurniture,
                  icon: Icons.weekend,
                ),
                DetailItem(
                  label: "عدد الغرف",
                  value: model.roomCounts.total.toString(),
                  icon: Icons.meeting_room_outlined,
                ),

                DetailItem(
                  label: "التقسيط",
                  value:
                      model.sellDetails!.installmentAllowed
                          ? "يقبل"
                          : "لا يقبل",
                  icon: Icons.payments,
                ),

                DetailItem(
                  label: "عدد الأقساط",
                  value: model.sellDetails!.installmentDuration.toString(),
                  icon: Icons.payments,
                ),
                DetailItem(
                  label: "الطابق",
                  value: model.floorNumber.toString(),
                  icon: Icons.stairs,
                ),
              ],
            )
            : DetailsContainer(
              details: [
                DetailItem(
                  label: "نوع الدفع",
                  value: model.rentDetails!.rentalPeriod,
                  icon: Icons.payments,
                ),
                DetailItem(
                  label: "المساحة",
                  value: model.area.toStringAsFixed(2),
                  icon: Icons.square_foot,
                ),
                DetailItem(
                  label: "نوع الملكية",
                  value: model.ownershipType,
                  icon: Icons.home_work_outlined,
                ),
                DetailItem(
                  label: "الجهة",
                  value: model.direction,
                  icon: Icons.explore,
                ),
                DetailItem(
                  label: "الفرش",
                  value: model.hasFurniture,
                  icon: Icons.weekend,
                ),

                DetailItem(
                  label: "عدد الغرف",
                  value: model.roomCounts.total.toString(),
                  icon: Icons.meeting_room_outlined,
                ),
                DetailItem(
                  label: "الطابق",
                  value: model.floorNumber.toString(),
                  icon: Icons.stairs,
                ),
              ],
            ),
      ],
    );
  }
}

class RatingSection extends GetView<PropertyDetailsController> {
  const RatingSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => RatingCard(
        rate: controller.rating.value,
        onRatingChanged: (newRating) {
          controller.updateRating(newRating);
        },
      ),
    );
  }
}
