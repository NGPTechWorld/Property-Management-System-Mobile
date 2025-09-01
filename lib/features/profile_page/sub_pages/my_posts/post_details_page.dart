import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_ms/core/routes/app_routes.dart';
import 'package:property_ms/core/utils/color_manager.dart';
import 'package:property_ms/core/utils/values_manager.dart';
import 'package:property_ms/core/utils/widgets/normal_app_bar.dart';
import 'package:property_ms/data/dto/post_dto.dart';
import 'package:property_ms/data/dto/property_dto.dart';
import 'package:property_ms/data/enums/loading_state_enum.dart';
import 'package:property_ms/features/profile_page/sub_pages/my_posts/my_posts_controller.dart';
import 'package:property_ms/features/profile_page/sub_pages/my_posts/my_posts_page.dart';
import 'package:property_ms/features/widgets/empty_card.dart';
import 'package:property_ms/features/widgets/loading_card.dart';
import 'package:property_ms/features/widgets/property_rent_card2_small.dart';
import 'package:property_ms/features/widgets/property_sale_card2_small.dart';

class PostDetailsPage extends GetView<MyPostsController> {
  const PostDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final post = Get.arguments as PostDto;
    return Scaffold(
      appBar: const NormalAppBar(title: 'تفاصيل المنشور'),
      body: RefreshIndicator(
        onRefresh: () async {
          await controller.refreshDetailsPage(post.id);
        },
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PostCard(post: post),
                const Divider(color: ColorManager.primary3Color),

                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppPadding.p14,
                  ),
                  child: Text(
                    'العقارات المقترحة',
                    style: Get.textTheme.headlineMedium!.copyWith(
                      color: ColorManager.secColor,
                    ),
                  ),
                ),
                const SizedBox(height: AppSize.s18),

                Obx(() {
                  if (controller.loadingSuggestionsState.value ==
                      LoadingState.loading) {
                    return const LoadingCard(isSmall: true);
                    // Column(
                    //   children: List.generate(2, (index) {
                    //     return Shimmer.fromColors(
                    //       baseColor: ColorManager.shimmerBaseColor,
                    //       highlightColor: ColorManager.shimmerHighlightColor,
                    //       child: Padding(
                    //         padding: const EdgeInsets.only(bottom: AppPadding.p12),
                    //         child: PropertyRentCard2Small(
                    //           model: PropertyDto.empty(),
                    //           isLoaging: true,
                    //         ),
                    //       ),
                    //     );
                    //   }),
                    // );
                  } else if (controller.loadingSuggestionsState.value ==
                      LoadingState.doneWithNoData) {
                    return const EmptyCard();
                  } else {
                    return Column(
                      children: List.generate(
                        controller.suggestionsdList.length,
                        (index) => Padding(
                          padding: const EdgeInsets.only(
                            bottom: AppPadding.p12,
                          ),
                          child: _buildPropertyCard(
                            controller.suggestionsdList[index],
                          ),
                        ),
                      ),
                    );
                  }
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPropertyCard(PropertyDto item) {
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
    } else {
      return const SizedBox();
    }
  }
}
