import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_ms/core/routes/app_routes.dart';
import 'package:property_ms/core/utils/color_manager.dart';
import 'package:property_ms/core/utils/values_manager.dart';
import 'package:property_ms/core/utils/widgets/normal_app_bar.dart';
import 'package:property_ms/data/dto/property_dto.dart';
import 'package:property_ms/data/enums/loading_state_enum.dart';
import 'package:property_ms/features/profile_page/sub_pages/favorites_page/favorites_controller.dart';
import 'package:property_ms/features/widgets/card_filter.dart';
import 'package:property_ms/features/widgets/property_rent_card.dart';
import 'package:property_ms/features/widgets/property_sale_card2_small.dart';
import 'package:shimmer/shimmer.dart';

class FavoritesPage extends GetView<FavoritesController> {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            children: [
              Container(
                width: AppSize.sWidth,
                height: 110 + AppSize.sStatusBarHeight,
                decoration: const BoxDecoration(
                  color: ColorManager.lightPrimaryColor,
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(24),
                  ),
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
                              controller.getFavorite();
                            },
                            child: CardFilter(
                              model: controller.cardFilterDefault[index],
                              isSelect:
                                  controller.selectedFilterIndex.value == index,
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
          ),
          const SizedBox(height: AppSize.s8),

          //! Body
          Expanded(
            child: Obx(() {
              final state = controller.loadingFavortieState.value;
              if (state == LoadingState.loading) {
                return ListView.builder(
                  itemCount: 3,
                  padding: const EdgeInsets.all(12),
                  itemBuilder:
                      (context, index) => Shimmer.fromColors(
                        baseColor: ColorManager.shimmerBaseColor,
                        highlightColor: ColorManager.shimmerHighlightColor,
                        child: PropertyRentCard(
                          model: PropertyDto.empty(),
                          isLoaging: true,
                        ),
                      ),
                );
              }

              if (state == LoadingState.doneWithNoData) {
                return const Center(
                  child: Padding(
                    padding: EdgeInsets.all(24.0),
                    child: Text('لا يوجد مفضلات حالياً.'),
                  ),
                );
              }

              return ListView.builder(
                controller: controller.scrollFavoritesController,
                padding: const EdgeInsets.all(12),
                itemCount: controller.favoriteList.length,
                itemBuilder: (context, index) {
                  final item = controller.favoriteList[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap:
                          () => Get.toNamed(
                            AppRoutes.propertyDetailsPage,
                            parameters: {"id": item.propertyId.toString()},
                          ),
                      // child: PropertyRentCard(model: item, isLoaging: false),
                      // child: PropertySaleCard(model: item),
                      child: PropertySaleCard2Small(model: item),
                    ),
                  );
                },
              );
            }),
          ),
          const SizedBox(height: AppSize.s24),
        ],
      ),
    );
  }
}
