import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_ms/core/utils/assets.gen.dart';
import 'package:property_ms/core/utils/color_manager.dart';
import 'package:property_ms/core/utils/values_manager.dart';
import 'package:property_ms/core/utils/widgets/custom_cached_network_image_widget.dart';
import 'package:property_ms/data/models/property_model.dart';
import 'package:property_ms/features/widgets/comparison_container.dart';
import 'package:property_ms/features/widgets/office_profile_reusable_widgets/info_card.dart';

class PropertyComparisonWidget extends StatelessWidget {
  final PropertyModel property1;
  final PropertyModel property2;

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
        property1.listingType == "بيع"
            ? ComparisonContainer(
              comparisons: [
                ComparisonItem(
                  label: "المساحة",
                  value1: property1.area.toStringAsFixed(2),
                  value2: property2.area.toStringAsFixed(2),
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
                  value1: property1.direction,
                  value2: property2.direction,
                  icon: Icons.explore_outlined,
                ),
                ComparisonItem(
                  label: "الفرش",
                  value1: property1.hasFurniture,
                  value2: property2.hasFurniture,
                  icon: Icons.weekend_outlined,
                ),
                ComparisonItem(
                  label: "عدد الغرف",
                  value1: property1.roomCounts.total.toString(),
                  value2: property2.roomCounts.total.toString(),
                  icon: Icons.meeting_room_outlined,
                ),

                ComparisonItem(
                  label: "التقسيط",
                  value1:
                      property1.sellDetails!.installmentAllowed
                          ? "يقبل"
                          : "لا يقبل",
                  value2:
                      property2.sellDetails!.installmentAllowed
                          ? "يقبل"
                          : "لا يقبل",
                  icon: Icons.payments_outlined,
                ),
                ComparisonItem(
                  label: "الطابق",
                  value1: property1.floorNumber.toString(),
                  value2: property2.floorNumber.toString(),
                  icon: Icons.stairs_outlined,
                ),
                ComparisonItem(
                  label: "نوم",
                  value1: property1.roomCounts.bedroom.toString(),
                  value2: property2.roomCounts.bedroom.toString(),
                  icon: Icons.bed_outlined,
                ),
                ComparisonItem(
                  label: "معيشة",
                  value1: property1.roomCounts.livingRoom.toString(),
                  value2: property2.roomCounts.livingRoom.toString(),
                  icon: Icons.weekend_outlined,
                ),
                ComparisonItem(
                  label: "حمام",
                  value1: property1.roomCounts.bathroom.toString(),
                  value2: property2.roomCounts.bathroom.toString(),
                  icon: Icons.bathtub_outlined,
                ),
                ComparisonItem(
                  label: "مطبخ",
                  value1: property1.roomCounts.kitchen.toString(),
                  value2: property2.roomCounts.kitchen.toString(),
                  icon: Icons.kitchen_outlined,
                ),
              ],
            )
            : ComparisonContainer(
              comparisons: [
                ComparisonItem(
                  label: "المساحة",
                  value1: property1.area.toStringAsFixed(2),
                  value2: property2.area.toStringAsFixed(2),
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
                  value1: property1.direction,
                  value2: property2.direction,
                  icon: Icons.explore_outlined,
                ),
                ComparisonItem(
                  label: "الفرش",
                  value1: property1.hasFurniture,
                  value2: property2.hasFurniture,
                  icon: Icons.weekend_outlined,
                ),
                ComparisonItem(
                  label: "عدد الغرف",
                  value1: property1.roomCounts.total.toString(),
                  value2: property2.roomCounts.total.toString(),
                  icon: Icons.meeting_room_outlined,
                ),

                ComparisonItem(
                  label: "الطابق",
                  value1: property1.floorNumber.toString(),
                  value2: property2.floorNumber.toString(),
                  icon: Icons.stairs_outlined,
                ),
                ComparisonItem(
                  label: "نوم",
                  value1: property1.roomCounts.bedroom.toString(),
                  value2: property2.roomCounts.bedroom.toString(),
                  icon: Icons.bed_outlined,
                ),
                ComparisonItem(
                  label: "معيشة",
                  value1: property1.roomCounts.livingRoom.toString(),
                  value2: property2.roomCounts.livingRoom.toString(),
                  icon: Icons.weekend_outlined,
                ),
                ComparisonItem(
                  label: "حمام",
                  value1: property1.roomCounts.bathroom.toString(),
                  value2: property2.roomCounts.bathroom.toString(),
                  icon: Icons.bathtub_outlined,
                ),
                ComparisonItem(
                  label: "مطبخ",
                  value1: property1.roomCounts.kitchen.toString(),
                  value2: property2.roomCounts.kitchen.toString(),
                  icon: Icons.kitchen_outlined,
                ),
              ],
            ),
      ],
    );
  }
}

class PropertyHeaderComparisonCard extends StatelessWidget {
  final PropertyModel property;

  const PropertyHeaderComparisonCard({super.key, required this.property});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: AppSize.s8),
        ClipRRect(
          borderRadius: BorderRadius.circular(AppSize.s8),
          child: CustomCachedNetworkImage(
            imageUrl: property.images.first.imageUrl,
            height: AppSize.s100,
            width: AppSize.sWidth * 0.4,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(height: AppSize.s8),
        Text(
          property.postTitle,
          style: Get.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        SizedBox(
          width: double.infinity,
          child: InfoCard(
            title: 'السعر',
            child: Text(
              property.listingType == "بيع"
                  ? property.sellDetails!.sellingPrice.toString()
                  : property.rentDetails!.price.toString(),
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
                    property.postDate,
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
