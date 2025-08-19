import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_ms/core/routes/app_routes.dart';
import 'package:property_ms/core/utils/color_manager.dart';
import 'package:property_ms/core/utils/values_manager.dart';
import 'package:property_ms/core/utils/widgets/normal_app_bar.dart';
import 'package:property_ms/data/dto/property_dto.dart';
import 'package:property_ms/data/dto/tourism_dto.dart';
import 'package:property_ms/features/profile_page/sub_pages/favorites_page/favorites_controller.dart';
import 'package:property_ms/features/widgets/card_filter.dart';
import 'package:property_ms/features/widgets/property_rent_card2_small.dart';
import 'package:property_ms/features/widgets/property_sale_card2_small.dart';
import 'package:property_ms/features/widgets/state_handler.dart';
import 'package:property_ms/features/widgets/tourisem_card_small.dart';
import 'package:shimmer/shimmer.dart';

class FavoritesPage extends GetView<FavoritesController> {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          await controller.refreshPage();
        },
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          controller: controller.scrollFavoritesController,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              FavoriteAppbar(controller: controller),
              const SizedBox(height: AppSize.s8),
              favoriteBody(),
              const SizedBox(height: AppSize.s24),
            ],
          ),
        ),
      ),
    );
  }

  Widget favoriteBody() {
    return Obx(
      () => StateHandler(
        state: controller.loadingFavortieState.value,
        dataWidget: ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          controller: controller.scrollFavoritesController,
          padding: const EdgeInsets.all(12),
          itemCount: controller.favoriteList.length,
          itemBuilder: (context, index) {
            final item = controller.favoriteList[index];
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: _buildFavoriteCard(item),
            );
          },
        ),
        loadingWidget: ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 10,
          padding: const EdgeInsets.all(12),
          itemBuilder:
              (context, index) => Shimmer.fromColors(
                baseColor: ColorManager.shimmerBaseColor,
                highlightColor: ColorManager.shimmerHighlightColor,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: PropertyRentCard2Small(
                    model: PropertyDto.empty(),
                    isLoaging: true,
                  ),
                ),
              ),
        ),
      ),
    );
  }

  Widget _buildFavoriteCard(dynamic item) {
    if (controller.selectedFilterIndex.value == 1 && item is PropertyDto) {
      if (item.listingType == "أجار") {
        return GestureDetector(
          onTap:
              () => Get.toNamed(
                AppRoutes.propertyDetailsPage,
                parameters: {"id": item.propertyId.toString()},
              ),
          child: PropertyRentCard2Small(model: item),
        );
      } else if (item.listingType == "بيع") {
        return GestureDetector(
          onTap:
              () => Get.toNamed(
                AppRoutes.propertyDetailsPage,
                parameters: {"id": item.propertyId.toString()},
              ),
          child: PropertySaleCard2Small(model: item),
        );
      }
    }
    if (controller.selectedFilterIndex.value == 0 && item is TourismDto) {
      return GestureDetector(
        onTap:
            () => Get.toNamed(
              AppRoutes.tourismDetailsPage,
              parameters: {"id": item.propertyId.toString()},
            ),
        child: TourisemCardSmall(model: item),
      );
    }
    return const SizedBox.shrink();
  }
}

class FavoriteAppbar extends StatelessWidget {
  const FavoriteAppbar({super.key, required this.controller});

  final FavoritesController controller;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: AppSize.sWidth,
          height: 110 + AppSize.sStatusBarHeight,
          decoration: const BoxDecoration(
            color: ColorManager.lightPrimaryColor,
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(24)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Obx(
                () => Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: List.generate(
                    controller.cardFilterDefault.length,
                    (index) => GestureDetector(
                      onTap: () {
                        controller.selectFilter(index);
                        // controller.getFavorite();
                      },
                      child: CardFilter(
                        model: controller.cardFilterDefault[index],
                        isSelect: controller.selectedFilterIndex.value == index,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        const NormalAppBar(title: 'المفضلة'),
      ],
    );
  }
}
