import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:property_ms/core/routes/app_routes.dart';
import 'package:property_ms/core/utils/assets.gen.dart';
import 'package:property_ms/core/utils/color_manager.dart';
import 'package:property_ms/core/utils/values_manager.dart';
import 'package:property_ms/core/utils/widgets/app_button.dart';
import 'package:property_ms/features/widgets/office_card_style2.dart';
import 'package:property_ms/features/widgets/office_profile_reusable_widgets/lacation_card.dart';
import 'package:property_ms/features/widgets/office_profile_reusable_widgets/map_button.dart';
import 'package:property_ms/features/widgets/office_profile_reusable_widgets/rating_card.dart';
import 'package:property_ms/features/widgets/price_section.dart';
import 'package:property_ms/features/widgets/property_reusable_widget/details_container.dart';
import 'package:property_ms/features/widgets/property_reusable_widget/image_carousel.dart';
import 'package:property_ms/features/widgets/tourisem_card.dart';
import 'package:shimmer/shimmer.dart';

import './tourism_details_controller.dart';

class TourismDetailsPage extends GetView<TourismDetailsController> {
  const TourismDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    const double appBarHeight = AppSize.s100 * 2.5;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          TourismDetailsAppbar(
            appBarHeight: appBarHeight,
            controller: controller,
          ),
          ToursimDetailsBody(controller: controller),
        ],
      ),
      bottomNavigationBar: PriceSection(
        price: controller.tourismDetails.price,
        onPressed: () {},
        payrate: controller.tourismDetails.payRate,
      ),
    );
  }
}

class ToursimDetailsBody extends StatelessWidget {
  const ToursimDetailsBody({super.key, required this.controller});

  final TourismDetailsController controller;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppPadding.p24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: AppSize.s12),
            Row(
              children: [
                const Icon(Icons.access_time),
                const SizedBox(width: AppSize.s12),
                Text('تاريخ النشر : ${controller.tourismDetails.publishDate}'),
              ],
            ),
            // const SizedBox(height: AppSize.s4),
            TitleAndCompare(controller: controller),
            TourismDescriptionSection(controller: controller),
            SizedBox(
              width: double.infinity,
              child: RatingSection(controller: controller),
            ),
            LocationAndMapRow(controller: controller),
            ResponsibleOfficeSection(controller: controller),

            const SizedBox(height: AppSize.s12),
            LabeledDetailsSection(
              title: 'تفاصيل المكان السياحي',
              details: [
                DetailItem(
                  label: "المساحة",
                  value: controller.tourismDetails.area,
                  icon: Icons.square_foot_outlined,
                ),
                DetailItem(
                  label: "الفرش",
                  value: controller.tourismDetails.furnishing,
                  icon: Icons.weekend_outlined,
                ),
                DetailItem(
                  label: "الكهرباء",
                  value: controller.tourismDetails.electricity,
                  icon: Icons.bolt_outlined,
                ),
                DetailItem(
                  label: "الماء",
                  value: controller.tourismDetails.water,
                  icon: Icons.water_drop_outlined,
                ),
                DetailItem(
                  label: "المسبح",
                  value: controller.tourismDetails.pool,
                  icon: Icons.pool_outlined,
                ),
              ],
            ),

            const SizedBox(height: AppSize.s8),
            LabeledDetailsSection(
              title: 'تفاصيل الغرف',
              details: [
                DetailItem(
                  label: "غرفة نوم",
                  value:
                      controller.tourismDetails.roomDetails.bedrooms.toString(),
                  icon: Icons.bed_outlined,
                ),
                DetailItem(
                  label: "غرفة معيشة",
                  value:
                      controller.tourismDetails.roomDetails.livingRooms
                          .toString(),
                  icon: Icons.weekend_outlined,
                ),
                DetailItem(
                  label: "حمام",
                  value:
                      controller.tourismDetails.roomDetails.bathrooms
                          .toString(),
                  icon: Icons.bathtub_outlined,
                ),
                DetailItem(
                  label: "مطبخ",
                  value:
                      controller.tourismDetails.roomDetails.kitchens.toString(),
                  icon: Icons.kitchen_outlined,
                ),
              ],
            ),
            const SizedBox(height: AppSize.s8),

            Text(
              'المرفقات',
              style: Get.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: AppSize.s8),

            WrapFeatures(
              features: controller.tourismDetails.features,
              spacing: AppPadding.p16,
              runSpacing: AppPadding.p8,
            ),

            const SizedBox(height: AppSize.s24),
            RelatedTourismSection(controller: controller),
          ],
        ),
      ),
    );
  }
}

class TourismDetailsAppbar extends StatelessWidget {
  const TourismDetailsAppbar({
    super.key,
    required this.appBarHeight,
    required this.controller,
  });

  final double appBarHeight;
  final TourismDetailsController controller;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: appBarHeight,
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarBrightness: Brightness.dark,
      ),
      elevation: 0.0,
      stretch: true,
      // flexibleSpace: TourismImageHeader(
      //   controller: controller,
      //   appBarHeight: appBarHeight,
      // ),
      leading: IconButton(
        icon: Container(
          height: AppSize.s40,
          width: AppSize.s40,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: ColorManager.primaryColor,
          ),
          alignment: Alignment.center,
          child: const Icon(Icons.chevron_left, color: Colors.white),
        ),
        onPressed: () => Get.back(),
      ),
      actions: [
        Obx(
          () => GestureDetector(
            onTap: controller.toggleFavorite,
            child: Container(
              width: 32,
              height: 32,
              margin: const EdgeInsets.symmetric(horizontal: 12),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: ColorManager.cardBackground,
              ),
              child: Center(
                child:
                    controller.isFavorite.value
                        ? Assets.icons.favoriteFillIcon.svg(
                          width: 16,
                          colorFilter: const ColorFilter.mode(
                            Colors.red,
                            BlendMode.srcIn,
                          ),
                        )
                        : Assets.icons.favoriteFillIcon.svg(
                          width: 16,
                          colorFilter: const ColorFilter.mode(
                            ColorManager.grey3,
                            BlendMode.srcIn,
                          ),
                        ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class TourismDescriptionSection extends StatelessWidget {
  const TourismDescriptionSection({super.key, required this.controller});
  final TourismDetailsController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'وصف المكان السياحي',
          style: Get.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppPadding.p16,
            vertical: AppPadding.p8,
          ),
          child: Text(
            controller.tourismDetails.description,
            style: Get.textTheme.bodyMedium?.copyWith(
              color: ColorManager.textColor1,
              height: 1.7,
            ),
          ),
        ),
      ],
    );
  }
}

class RelatedTourismSection extends StatelessWidget {
  const RelatedTourismSection({super.key, required this.controller});

  final TourismDetailsController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'أماكن سياحية ذات صلة',
          style: Get.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: AppSize.s8),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(
              controller.recommendedTourisem.length,
              (index) =>
                  TourisemCard(model: controller.recommendedTourisem[index]),
            ),
          ),
        ),
      ],
    );
  }
}

class LabeledDetailsSection extends StatelessWidget {
  const LabeledDetailsSection({
    super.key,
    required this.title,
    required this.details,
  });

  final String title;
  final List<DetailItem> details;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Get.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        DetailsContainer(details: details),
      ],
    );
  }
}

class ResponsibleOfficeSection extends StatelessWidget {
  const ResponsibleOfficeSection({super.key, required this.controller});

  final TourismDetailsController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'المكتب المسؤول',
          style: Get.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: AppSize.s12),
        OfficeCardStyle2(model: controller.tourismDetails.responsibleOffice),
      ],
    );
  }
}

class LocationAndMapRow extends StatelessWidget {
  const LocationAndMapRow({super.key, required this.controller});
  final TourismDetailsController controller;
  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [LocationCard(location: 'ريف,دمشق قدسيا'), MapButton()],
    );
  }
}

class RatingSection extends StatelessWidget {
  const RatingSection({super.key, required this.controller});

  final TourismDetailsController controller;

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

class TitleAndCompare extends StatelessWidget {
  const TitleAndCompare({super.key, required this.controller});

  final TourismDetailsController controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "العنوان:  ${controller.tourismDetails.title} ${controller.tourismDetails.area}",
          // "العنوان:  ${controller.tourism.title} ${controller.tourism.area} م²",
          style: Get.textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.bold,
            color: ColorManager.primaryDark,
          ),
        ),
        AppButton(
          text: 'قارن',
          radius: AppSize.s16,
          icon: Assets.icons.property.svg(
            colorFilter: const ColorFilter.mode(
              ColorManager.white,
              BlendMode.srcIn,
            ),
          ),
          backgroundColor: ColorManager.yello,
          iconOnLeft: true,
          onPressed: () => Get.toNamed(AppRoutes.compareTourismPage),
        ),
      ],
    );
  }
}

class TourismImageHeader extends StatelessWidget {
  const TourismImageHeader({
    super.key,
    required this.controller,
    required this.appBarHeight,
  });

  final TourismDetailsController controller;
  final double appBarHeight;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return ImageCarousel(
        images: controller.tourismDetails.images.map((asset) => asset).toList(),
        currentIndex: controller.sliderIndex,
        activeDotColor: ColorManager.primaryColor,
        inactiveDotColor: Colors.grey.shade300,
      );
    });
  }
}

class WrapFeatures extends StatelessWidget {
  const WrapFeatures({
    super.key,
    required this.features,
    this.icon = const Icon(Icons.check_circle, size: 16, color: Colors.green),
    this.backgroundColor = const Color(0xFFF0F0F0),
    this.textStyle,
    this.spacing = 8,
    this.runSpacing = 8,
  });

  final List<String> features;
  final Icon icon;
  final Color backgroundColor;
  final TextStyle? textStyle;
  final double spacing;
  final double runSpacing;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: spacing,
      runSpacing: runSpacing,
      children:
          features.map((feature) {
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  icon,
                  const SizedBox(width: 8),
                  Text(
                    feature,
                    style: textStyle ?? Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            );
          }).toList(),
    );
  }
}
