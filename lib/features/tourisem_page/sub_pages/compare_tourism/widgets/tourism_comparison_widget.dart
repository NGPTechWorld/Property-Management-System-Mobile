import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_ms/core/utils/color_manager.dart';
import 'package:property_ms/core/utils/values_manager.dart';
import 'package:property_ms/features/tourisem_page/sub_pages/tourism_details/models/tourism_detail_model.dart';
import 'package:property_ms/features/widgets/comparison_container.dart';
import 'package:property_ms/features/widgets/office_profile_reusable_widgets/info_card.dart';

class TourismComparisonWidget extends StatelessWidget {
  final TourismDetailModel tourism1;
  final TourismDetailModel tourism2;

  const TourismComparisonWidget({
    super.key,
    required this.tourism1,
    required this.tourism2,
  });

  @override
  Widget build(BuildContext context) {
    final featureItems = _buildFeatureComparisonList(
      tourism1.features,
      tourism2.features,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: AppSize.s24),
        IntrinsicHeight(
          child: Row(
            children: [
              Expanded(child: TourismHeaderComparisonCard(model: tourism1)),
              VerticalDivider(thickness: 1.5, color: Colors.grey.shade300),
              Expanded(child: TourismHeaderComparisonCard(model: tourism2)),
            ],
          ),
        ),
        const SizedBox(height: AppSize.s16),
        ComparisonContainer(
          comparisons: [
            ComparisonItem(
              label: "المساحة",
              value1: tourism1.area,
              value2: tourism2.area,
              icon: Icons.square_foot_outlined,
            ),
            ComparisonItem(
              label: "الفرش",
              value1: tourism1.furnishing,
              value2: tourism2.furnishing,
              icon: Icons.weekend_outlined,
            ),
            ComparisonItem(
              label: "الكهرباء",
              value1: tourism1.electricity,
              value2: tourism2.electricity,
              icon: Icons.electrical_services_outlined,
            ),
            ComparisonItem(
              label: "المياه",
              value1: tourism1.water,
              value2: tourism2.water,
              icon: Icons.water_drop_outlined,
            ),
            ComparisonItem(
              label: "المسبح",
              value1: tourism1.pool,
              value2: tourism2.pool,
              icon: Icons.pool_outlined,
            ),
            ComparisonItem(
              label: "نوم",
              value1: tourism1.roomDetails.bedrooms.toString(),
              value2: tourism2.roomDetails.bedrooms.toString(),
              icon: Icons.bed_outlined,
            ),
            ComparisonItem(
              label: "معيشة",
              value1: tourism1.roomDetails.livingRooms.toString(),
              value2: tourism2.roomDetails.livingRooms.toString(),
              icon: Icons.chair_outlined,
            ),
            ComparisonItem(
              label: "حمام",
              value1: tourism1.roomDetails.bathrooms.toString(),
              value2: tourism2.roomDetails.bathrooms.toString(),
              icon: Icons.bathtub_outlined,
            ),
            ComparisonItem(
              label: "مطبخ",
              value1: tourism1.roomDetails.kitchens.toString(),
              value2: tourism2.roomDetails.kitchens.toString(),
              icon: Icons.kitchen_outlined,
            ),
          ],
        ),
        const SizedBox(height: AppSize.s16),
        Text(
          'المرفقات',
          style: Get.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        FeatureComparisonContainer(items: featureItems),
      ],
    );
  }

  List<FeatureComparisonItem> _buildFeatureComparisonList(
    List<String> features1,
    List<String> features2,
  ) {
    final all = <String>{...features1, ...features2};
    return all
        .map(
          (feature) => FeatureComparisonItem(
            feature: feature,
            hasFeature1: features1.contains(feature),
            hasFeature2: features2.contains(feature),
          ),
        )
        .toList();
  }
}

class TourismHeaderComparisonCard extends StatelessWidget {
  final TourismDetailModel model;

  const TourismHeaderComparisonCard({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: AppSize.s8),
        ClipRRect(
          borderRadius: BorderRadius.circular(AppSize.s8),
          child: Image.asset(
            model.images.first,
            height: AppSize.s100,
            width: AppSize.sWidth * 0.4,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(height: AppSize.s8),
        Text(
          model.title,
          textAlign: TextAlign.center,
          style: Get.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
        ),
        InfoCard(
          title: "السعر",
          child: Text(
            model.price,
            style: Get.textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.bold,
              color: ColorManager.primaryColor,
            ),
          ),
        ),
        const SizedBox(height: AppSize.s8),
        Padding(
          padding: const EdgeInsets.only(right: AppPadding.p8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.access_time_outlined,
                    color: Colors.blueGrey,
                  ),
                  const SizedBox(width: AppSize.s4),
                  Text(
                    model.publishDate,
                    style: Get.textTheme.bodySmall?.copyWith(
                      color: ColorManager.textColor1,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AppSize.s8),
              Row(
                children: [
                  const Icon(
                    Icons.location_on_outlined,
                    color: Colors.blueGrey,
                  ),
                  const SizedBox(width: AppSize.s4),
                  Text(
                    model.location,
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

class FeatureComparisonItem {
  final String feature;
  final bool hasFeature1;
  final bool hasFeature2;

  FeatureComparisonItem({
    required this.feature,
    required this.hasFeature1,
    required this.hasFeature2,
  });
}

class FeatureComparisonContainer extends StatelessWidget {
  final List<FeatureComparisonItem> items;

  const FeatureComparisonContainer({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppPadding.p12),
      margin: const EdgeInsets.symmetric(vertical: AppPadding.p12),
      decoration: BoxDecoration(
        color: ColorManager.white,
        borderRadius: BorderRadius.circular(AppSize.s12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: List.generate(items.length, (index) {
          final item = items[index];
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: AppPadding.p8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(
                      item.hasFeature1
                          ? Icons.check_circle_outline
                          : Icons.cancel_outlined,
                      color: item.hasFeature1 ? Colors.green : Colors.red,
                    ),
                    Expanded(
                      child: Text(
                        item.feature,
                        textAlign: TextAlign.center,
                        style: Get.textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Icon(
                      item.hasFeature2
                          ? Icons.check_circle_outline
                          : Icons.cancel_outlined,
                      color: item.hasFeature2 ? Colors.green : Colors.red,
                    ),
                  ],
                ),
              ),
              if (index != items.length - 1) const Divider(height: AppSize.s16),
            ],
          );
        }),
      ),
    );
  }
}
