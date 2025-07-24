import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_ms/core/utils/assets.gen.dart';
import 'package:property_ms/core/utils/color_manager.dart';
import 'package:property_ms/core/utils/values_manager.dart';
import 'package:property_ms/features/compare/compare_properties/widgets/comparison_container.dart';
import 'package:property_ms/features/property_page/sub_pages/property_details/model/property_details_model.dart';
import 'package:property_ms/features/widgets/office_profile_reusable_widgets/info_card.dart';

class PropertyComparisonWidget extends StatelessWidget {
  final PropertyDetailsModel property1;
  final PropertyDetailsModel property2;

  const PropertyComparisonWidget({
    super.key,
    required this.property1,
    required this.property2,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: AppSize.s24),
        IntrinsicHeight(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment:
                CrossAxisAlignment.stretch, // Ensures full height
            children: [
              Expanded(
                child: PropertyHeaderComparisonCard(property: property1),
              ),

              // Vertical Divider
              VerticalDivider(
                width: 24,
                thickness: 1.5,
                color: Colors.grey.shade300,
              ),
              Expanded(
                child: PropertyHeaderComparisonCard(property: property2),
              ),
            ],
          ),
        ),
        const SizedBox(height: AppSize.s16),
        ComparisonContainer(
          comparisons: [
            ComparisonItem(
              label: "المساحة",
              value1: property1.area,
              value2: property2.area,
              icon: Icons.square_foot_outlined,
            ),
            ComparisonItem(
              label: "نوع الملكية",
              value1: property1.ownershipType,
              value2: property2.ownershipType,
              icon: Icons.home_work_outlined,
            ),
            ComparisonItem(
              label: "الجهة",
              value1: property1.orientation,
              value2: property2.orientation,
              icon: Icons.explore_outlined,
            ),
            ComparisonItem(
              label: "الفرش",
              value1: property1.furnishing,
              value2: property2.furnishing,
              icon: Icons.weekend_outlined,
            ),
            ComparisonItem(
              label: "عدد الغرف",
              value1: property1.roomCount.toString(),
              value2: property2.roomCount.toString(),
              icon: Icons.meeting_room_outlined,
            ),
            ComparisonItem(
              label: "التقسيط",
              value1: property1.installmentAvailable,
              value2: property2.installmentAvailable,
              icon: Icons.payments_outlined,
            ),
            ComparisonItem(
              label: "الطابق",
              value1: property1.floor,
              value2: property2.floor,
              icon: Icons.stairs_outlined,
            ),
            ComparisonItem(
              label: "نوم",
              value1: property1.roomDetails.bedrooms.toString(),
              value2: property2.roomDetails.bedrooms.toString(),
              icon: Icons.bed_outlined,
            ),
            ComparisonItem(
              label: "معيشة",
              value1: property1.roomDetails.livingRooms.toString(),
              value2: property2.roomDetails.livingRooms.toString(),
              icon: Icons.weekend_outlined,
            ),
            ComparisonItem(
              label: "حمام",
              value1: property1.roomDetails.bathrooms.toString(),
              value2: property2.roomDetails.bathrooms.toString(),
              icon: Icons.bathtub_outlined,
            ),
            ComparisonItem(
              label: "مطبخ",
              value1: property1.roomDetails.kitchens.toString(),
              value2: property2.roomDetails.kitchens.toString(),
              icon: Icons.kitchen_outlined,
            ),
          ],
        ),
      ],
    );
  }
}

class PropertyHeaderComparisonCard extends StatelessWidget {
  final PropertyDetailsModel property;

  const PropertyHeaderComparisonCard({super.key, required this.property});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: AppSize.s8),
        ClipRRect(
          borderRadius: BorderRadius.circular(AppSize.s8),
          child: Image.asset(
            property.images.first.path,
            height: AppSize.s100,
            width: AppSize.sWidth * 0.4,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(height: AppSize.s8),
        Text(
          property.title,
          style: Get.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        SizedBox(
          width: double.infinity,
          child: InfoCard(
            title: 'السعر',
            child: Text(
              property.price,
              style: Get.textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: ColorManager.primaryColor,
              ),
            ),
          ),
        ),
        const SizedBox(height: AppSize.s8),
        Padding(
          padding: const EdgeInsets.only(right: AppPadding.p8),
          child: Column(
            children: [
              Row(
                children: [
                  const Icon(Icons.access_time, color: Colors.blueGrey),
                  const SizedBox(width: AppSize.s4),
                  Text(
                    property.publishDate,
                    style: Get.textTheme.bodySmall?.copyWith(
                      color: ColorManager.textColor1,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AppSize.s8),
              Row(
                children: [
                  Assets.icons.locationIcon.svg(
                    colorFilter: const ColorFilter.mode(
                      Colors.blueGrey,
                      BlendMode.srcIn,
                    ),
                  ),
                  const SizedBox(width: AppSize.s4),
                  Text(
                    property.location,
                    style: Get.textTheme.bodySmall?.copyWith(
                      color: ColorManager.textColor1,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
