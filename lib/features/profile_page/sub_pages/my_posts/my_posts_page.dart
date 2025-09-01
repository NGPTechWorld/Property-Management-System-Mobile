import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_ms/core/routes/app_routes.dart';
import 'package:property_ms/core/utils/assets.gen.dart';
import 'package:property_ms/core/utils/color_manager.dart';
import 'package:property_ms/core/utils/values_manager.dart';
import 'package:property_ms/core/utils/widgets/app_button.dart';
import 'package:property_ms/core/utils/widgets/custom_toasts.dart';
import 'package:property_ms/core/utils/widgets/normal_app_bar.dart';
import 'package:property_ms/data/dto/post_dto.dart';
import 'package:property_ms/features/profile_page/sub_pages/my_posts/bottom_sheets/add_post_bottom_sheet.dart';
import 'package:property_ms/features/widgets/card_filter.dart';
import 'package:property_ms/features/widgets/state_handler.dart';

import './my_posts_controller.dart';

class MyPostsPage extends GetView<MyPostsController> {
  const MyPostsPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          await controller.refreshPage();
        },
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            children: [
              _MyPostsHeader(controller: controller),
              const SizedBox(height: AppSize.s8),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Obx(
                  () => StateHandler(
                    state: controller.loadingAllPosts.value,
                    dataWidget: Column(
                      children:
                          controller.filteredPostsList.map((post) {
                            return GestureDetector(
                              onTap: () async {
                                controller.getUserSuggestionsProperties(
                                  postId: post.id,
                                );
                                Get.toNamed(
                                  AppRoutes.postDetailsPage,
                                  arguments: post,
                                );
                              },
                              child: PostCard(post: post),
                            );
                          }).toList(),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 100),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:
            () => Get.bottomSheet(
              AddPostBottomSheet(),
              isScrollControlled: true,
              backgroundColor: Colors.transparent,
            ),
        isExtended: true,
        backgroundColor: ColorManager.primaryColor,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}

class PostCard extends StatelessWidget {
  final PostDto post;
  const PostCard({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: AppPadding.p16,
        vertical: AppPadding.p8,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppSize.s16),
        color: ColorManager.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(AppPadding.p16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        post.location,
                        style: Get.textTheme.headlineSmall!.copyWith(
                          color: ColorManager.primaryDark,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),

                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppPadding.p12,
                        vertical: AppPadding.p6,
                      ),
                      decoration: BoxDecoration(
                        color:
                            post.status == 'قيد الانتظار'
                                ? ColorManager.yello
                                : post.status == "مقبول"
                                ? ColorManager.greenColor
                                : ColorManager.redColor,
                        borderRadius: BorderRadius.circular(AppSize.s30),
                      ),
                      child: Text(
                        post.status,
                        style: Get.textTheme.bodySmall!.copyWith(
                          color: ColorManager.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(width: AppSize.s12),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppPadding.p12,
                        vertical: AppPadding.p6,
                      ),
                      decoration: BoxDecoration(
                        color:
                            post.type == "أجار"
                                ? ColorManager.primaryColor
                                : ColorManager.primaryDark,
                        borderRadius: BorderRadius.circular(AppSize.s30),
                      ),
                      child: Text(
                        post.type,
                        style: Get.textTheme.bodySmall!.copyWith(
                          color: ColorManager.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: AppSize.s8),
                Text(
                  post.description,
                  style: Get.textTheme.bodyMedium!.copyWith(
                    color: ColorManager.primary5Color,
                    height: 1.4,
                  ),
                ),
                const SizedBox(height: AppSize.s12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'تاريخ النشر ${post.createdAt}',
                      style: Get.textTheme.bodySmall!.copyWith(
                        color: ColorManager.primary5Color,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          '${post.budget.toStringAsFixed(0)} \$',
                          style: Get.textTheme.headlineSmall!.copyWith(
                            color: ColorManager.secColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: AppSize.s16),
                        _buildActionButton(
                          icon: Assets.icons.deleteIcon,
                          color: ColorManager.redColor,
                          onTap: () => _deletePost(post),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton({
    required SvgGenImage icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: AppSize.s34,
        height: AppSize.s34,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color.withOpacity(0.1),
        ),
        child: Center(
          child: icon.svg(
            width: AppSize.s16,
            height: AppSize.s16,
            colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
          ),
        ),
      ),
    );
  }

  void _deletePost(PostDto post) {
    Get.bottomSheet(
      Container(
        height: 250,
        padding: const EdgeInsets.all(AppPadding.p16),
        decoration: const BoxDecoration(
          color: ColorManager.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(AppSize.s24),
            topRight: Radius.circular(AppSize.s24),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: AppSize.s40,
              height: AppSize.s4,
              margin: const EdgeInsets.only(bottom: AppSize.s16),
              decoration: BoxDecoration(
                color: ColorManager.grey3.withOpacity(0.3),
                borderRadius: BorderRadius.circular(AppSize.s2),
              ),
            ),
            Text(
              'هل أنت متأكد من حذف هذا المنشور؟',
              style: Get.textTheme.titleMedium!.copyWith(
                color: ColorManager.primaryDark,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: AppSize.s24),
            Row(
              children: [
                Expanded(
                  child: AppButton(
                    text: 'إلغاء',
                    onPressed: () => Get.back(),
                    backgroundColor: ColorManager.grey3,
                    fontColor: ColorManager.white,
                    fontWeight: FontWeight.bold,
                    radius: AppSize.s12,
                    padding: const EdgeInsets.symmetric(
                      vertical: AppPadding.p16,
                    ),
                  ),
                ),
                const SizedBox(width: AppSize.s12),
                Expanded(
                  child: AppButton(
                    text: 'نعم، حذف',
                    onPressed: () {
                      Get.find<MyPostsController>().deletePost(post.id);
                      const CustomToasts(
                        message: 'تم حذف المنشور بنجاح',
                        type: CustomToastType.delete,
                      ).show();
                      Get.back();
                    },
                    backgroundColor: ColorManager.redColor,
                    fontColor: Colors.white,
                    fontWeight: FontWeight.bold,
                    radius: AppSize.s12,
                    padding: const EdgeInsets.symmetric(
                      vertical: AppPadding.p16,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
    );
  }
}

class _MyPostsHeader extends StatelessWidget {
  const _MyPostsHeader({required this.controller});

  final MyPostsController controller;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Container(
              width: AppSize.sWidth,
              height: 110 + AppSize.sStatusBarHeight,
              decoration: BoxDecoration(
                color: ColorManager.lightPrimaryColor,
                border: Border.all(color: ColorManager.primary6Color),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Obx(
                    () => Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: List.generate(
                        controller.cardFilter.length,
                        (index) => GestureDetector(
                          onTap: () {
                            controller.selectFilter(index);
                          },
                          child: CardFilter(
                            model: controller.cardFilter[index],
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
          ],
        ),

        const NormalAppBar(title: 'منشوراتي'),
      ],
    );
  }
}
