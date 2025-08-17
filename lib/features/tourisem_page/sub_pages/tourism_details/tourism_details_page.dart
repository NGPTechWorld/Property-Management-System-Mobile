import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_ms/core/routes/app_routes.dart';
import 'package:property_ms/core/utils/assets.gen.dart';
import 'package:property_ms/core/utils/color_manager.dart';
import 'package:property_ms/core/utils/values_manager.dart';
import 'package:property_ms/core/utils/widgets/app_button.dart';
import 'package:property_ms/data/dto/tourism_dto.dart';
import 'package:property_ms/data/enums/loading_state_enum.dart';
import 'package:property_ms/features/widgets/office_card_style2.dart';
import 'package:property_ms/features/widgets/office_profile_reusable_widgets/lacation_card.dart';
import 'package:property_ms/features/widgets/office_profile_reusable_widgets/map_button.dart';
import 'package:property_ms/features/widgets/office_profile_reusable_widgets/rating_card.dart';
import 'package:property_ms/features/widgets/price_section.dart';
import 'package:property_ms/features/widgets/property_reusable_widget/details_container.dart';
import 'package:property_ms/features/widgets/property_reusable_widget/image_carousel.dart';
import 'package:property_ms/features/widgets/tourisem_card2.dart';
import 'package:property_ms/features/widgets/tourisem_card_small.dart';
import 'package:shimmer/shimmer.dart';
import './tourism_details_controller.dart';

class TourismDetailsPage extends GetView<TourismDetailsController> {
  const TourismDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    const double appBarHeight = AppSize.s100 * 2.5;
    return Scaffold(
      body: SafeArea(
        top: false,
        child: Obx(
          () =>
              controller.loadingState.value == LoadingState.loading
                  ? const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [Center(child: CircularProgressIndicator())],
                  )
                  : controller.loadingState.value == LoadingState.doneWithData
                  ? Stack(
                    children: [
                      NestedScrollView(
                        controller: controller.scrollController,
                        headerSliverBuilder: (context, innerBoxIsScrolled) {
                          return [
                            TourismDetailsAppBar(
                              appBarHeight: appBarHeight,
                              controller: controller,
                            ),
                          ];
                        },
                        body: TourismDetailsBody(controller: controller),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: PriceSection(
                          price: controller.tourismDetails!.price.toString(),
                          onPressed: () async {
                            await controller.getTourismRelated();
                          },
                          payrate: 'يومي',
                        ),
                      ),
                    ],
                  )
                  : Container(),
        ),
      ),
    );
  }
}

class TourismDetailsBody extends StatelessWidget {
  const TourismDetailsBody({super.key, required this.controller});

  final TourismDetailsController controller;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(bottom: AppPadding.p24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
            ),
            padding: const EdgeInsets.symmetric(horizontal: AppPadding.p16),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: AppSize.s12),
                Row(
                  children: [
                    const Icon(Icons.access_time),
                    const SizedBox(width: AppSize.s12),
                    Text('تاريخ النشر : ${controller.tourismDetails!.date}'),
                  ],
                ),
                TitleAndCompare(controller: controller),
                SizedBox(
                  width: double.infinity,
                  child: RatingSection(controller: controller),
                ),
                LocationAndMapRow(controller: controller),
                ResponsibleOfficeSection(controller: controller),
                const SizedBox(height: AppSize.s12),
                TourismDescriptionSection(controller: controller),
                const SizedBox(height: AppSize.s12),
                LabeledDetailsSection(
                  title: 'تفاصيل المكان السياحي',
                  details: [
                    DetailItem(
                      label: "المساحة",
                      value: controller.tourismDetails!.area.toStringAsFixed(2),
                      icon: Icons.square_foot_outlined,
                    ),
                    DetailItem(
                      label: "الفرش",
                      value: controller.tourismDetails!.hasFurniture,
                      icon: Icons.weekend_outlined,
                    ),
                    DetailItem(
                      label: "الكهرباء",
                      value: controller.tourismDetails!.electricity,
                      icon: Icons.bolt_outlined,
                    ),
                    DetailItem(
                      label: "الماء",
                      value: controller.tourismDetails!.water,
                      icon: Icons.water_drop_outlined,
                    ),
                    DetailItem(
                      label: "المسبح",
                      value: controller.tourismDetails!.pool,
                      icon: Icons.pool_outlined,
                    ),
                  ],
                ),

                const SizedBox(height: AppSize.s8),
                LabeledDetailsSection(
                  title: 'تفاصيل الغرف',
                  details: [
                    DetailItem(
                      label: "عدد الغرف",
                      value: controller.tourismDetails!.roomCount.toString(),
                      icon: Icons.living_outlined,
                    ),
                    DetailItem(
                      label: "غرف النوم",
                      value: controller.tourismDetails!.bedroomCount.toString(),
                      icon: Icons.bed_outlined,
                    ),
                    DetailItem(
                      label: "غرف المعيشة",
                      value:
                          controller.tourismDetails!.livingRoomCount.toString(),
                      icon: Icons.weekend_outlined,
                    ),
                    DetailItem(
                      label: "حمام",
                      value:
                          controller.tourismDetails!.bathroomCount.toString(),
                      icon: Icons.bathtub_outlined,
                    ),
                    DetailItem(
                      label: "مطبخ",
                      value: controller.tourismDetails!.kitchenCount.toString(),
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
                  backgroundColor: ColorManager.white,
                  features: controller.tourismDetails!.additionalServices,
                  spacing: AppPadding.p16,
                  runSpacing: AppPadding.p8,
                ),

                const SizedBox(height: AppSize.s24),
                RelatedTourismSection(controller: controller),
                const SizedBox(height: AppSize.s100),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TourismDetailsAppBar extends StatelessWidget {
  const TourismDetailsAppBar({
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
      toolbarHeight: kToolbarHeight + AppSize.s10,
      elevation: 0,
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
          () => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 18),
            child: GestureDetector(
              onTap: () {
                controller.toggleFavorite();
              },
              child: Container(
                width: 32,
                height: 32,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: ColorManager.cardBackground,
                ),
                child: Center(
                  child: Assets.icons.favoriteFillIcon.svg(
                    width: 16,
                    colorFilter: ColorFilter.mode(
                      controller.isFavorite.value
                          ? Colors.red
                          : ColorManager.grey3,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 8),
      ],

      flexibleSpace: FlexibleSpaceBar(
        collapseMode: CollapseMode.pin,
        titlePadding: EdgeInsets.zero,
        expandedTitleScale: 1.1,
        background: ImageCarousel(
          images:
              controller.tourismDetails!.images.map((asset) => asset).toList(),
          currentIndex: controller.sliderIndex,
          activeDotColor: ColorManager.primaryColor,
          inactiveDotColor: Colors.grey.shade300,
        ),
      ),
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
            controller.tourismDetails!.description,
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
          child: Obx(
            () => Row(
              children: [
                Row(
                  children: List.generate(
                    controller.tourismRelatedList.length,
                    (index) => GestureDetector(
                      onTap: () {
                        //! @OsamaZerkawi here toNamed should be
                        Get.offNamed(
                          AppRoutes.tourismDetailsPage,
                          parameters: {
                            'id':
                                controller.tourismRelatedList[index].propertyId
                                    .toString(),
                          },
                        );
                      },
                      child: TourisemCard2(
                        model: controller.tourismRelatedList[index],
                      ),
                    ),
                  ),
                ),
                controller.loadingRelatedTourismState.value ==
                        LoadingState.loading
                    ? Row(
                      children: List.generate(3, (index) {
                        return Shimmer.fromColors(
                          baseColor: ColorManager.shimmerBaseColor,
                          highlightColor: ColorManager.shimmerHighlightColor,
                          child: TourisemCardSmall(
                            model: TourismDto.empty(),
                            isLoading: true,
                          ),
                        );
                      }),
                    )
                    : Container(),
              ],
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
        GestureDetector(
          onTap: () {
            Get.toNamed(
              AppRoutes.officeDetails,
              arguments: controller.tourismDetails!.office!.id,
            );
          },
          child: OfficeCardStyle2(model: controller.tourismDetails!.office!),
        ),
      ],
    );
  }
}

class LocationAndMapRow extends StatelessWidget {
  const LocationAndMapRow({super.key, required this.controller});
  final TourismDetailsController controller;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        LocationCard(location: controller.tourismDetails!.location),
        const MapButton(),
      ],
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
          "العنوان:  ${controller.tourismDetails!.postTitle} ",
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
          onPressed: () => controller.openSelectTourismBottomSheet(),
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
        images:
            controller.tourismDetails!.images.map((asset) => asset).toList(),
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
