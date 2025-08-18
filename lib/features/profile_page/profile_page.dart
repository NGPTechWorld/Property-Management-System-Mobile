import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_ms/core/routes/app_routes.dart';
import 'package:property_ms/core/utils/assets.gen.dart';
import 'package:property_ms/core/utils/color_manager.dart';
import 'package:property_ms/core/utils/values_manager.dart';
import 'package:property_ms/core/utils/widgets/custom_cached_network_image_widget.dart';
import 'package:property_ms/core/utils/widgets/normal_app_bar.dart';
import 'package:property_ms/data/enums/loading_state_enum.dart';
import 'package:property_ms/features/widgets/loading_card.dart';

import 'profile_controller.dart';

class ProfilePage extends GetView<ProfileController> {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ProfileController());
    return Scaffold(
      appBar: const NormalAppBar(title: "الملف الشخصي"),
      body: RefreshIndicator(
        onRefresh: () async {
          await controller.refreshPage();
        },
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Obx(
                () =>
                    controller.loadingState.value == LoadingState.loading
                        ? const Center(child: LoadingCard(isSmall: true))
                        : const CardUserInfo(),
              ),

              const FavAndPostCard(),
              const SizedBox(height: AppSize.s8),
              SettingsCard(
                title: "معلومات حسابي",
                icon: Assets.icons.users,
                onTap: () {
                  Get.toNamed(AppRoutes.accountInfoRoute);
                },
              ),
              SettingsCard(
                title: "ممتلكاتي",
                icon: Assets.icons.box,
                onTap: () {
                  Get.toNamed(AppRoutes.mySalesRoute);
                },
              ),
              SettingsCard(
                title: "الدعم والمساعدة",
                icon: Assets.icons.supportIcon,
                onTap: () {
                  Get.toNamed(AppRoutes.supportPage);
                },
              ),
              SettingsCard(
                title: "تسجيل الخروج",
                icon: Assets.icons.logout,
                onTap: () {
                  controller.logout();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SettingsCard extends StatelessWidget {
  final String title;
  final SvgGenImage icon;
  final Function onTap;
  const SettingsCard({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppPadding.p16,
          vertical: AppPadding.p4,
        ),
        child: Container(
          //  height: AppSize.sHeight * 0.15,
          padding: const EdgeInsets.all(AppPadding.p14),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(15)),
            border: Border.all(color: ColorManager.grey3, width: 1),
            color: ColorManager.white,
          ),
          child: Padding(
            padding: const EdgeInsets.all(AppPadding.p4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppPadding.p14,
                  ),
                  child: Text(
                    title,
                    style: Get.textTheme.bodyLarge!.copyWith(
                      color: ColorManager.grey3,
                      fontSize: FontSize.s14,
                    ),
                  ),
                ),

                icon.svg(
                  height: AppSize.s26,
                  colorFilter: const ColorFilter.mode(
                    ColorManager.grey3,
                    BlendMode.srcIn,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class FavAndPostCard extends StatelessWidget {
  const FavAndPostCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppPadding.p16),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () => Get.toNamed(AppRoutes.myPostsPage),
              child: Container(
                height: AppSize.sHeight * 0.15,
                padding: const EdgeInsets.all(AppPadding.p14),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(AppSize.s30),
                  ),
                  border: Border.all(color: ColorManager.yello, width: 2),
                  color: ColorManager.yello.withAlpha(20),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Assets.icons.posts.svg(
                      height: AppSize.sHeight * 0.04,
                      colorFilter: const ColorFilter.mode(
                        ColorManager.yello,
                        BlendMode.srcIn,
                      ),
                    ),
                    const SizedBox(height: AppSize.s8),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppPadding.p14,
                      ),
                      child: Text(
                        "منشوراتي",
                        style: Get.textTheme.bodyLarge!.copyWith(
                          color: ColorManager.yello,
                          fontSize: FontSize.s16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(width: AppSize.s16),
          Expanded(
            child: GestureDetector(
              onTap: () => Get.toNamed(AppRoutes.favoritesRoute),
              child: Container(
                height: AppSize.sHeight * 0.15,
                padding: const EdgeInsets.all(AppPadding.p14),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(AppSize.s30),
                  ),
                  border: Border.all(color: ColorManager.redColor, width: 2),
                  color: ColorManager.redColor.withAlpha(20),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Assets.icons.favorite.svg(
                      height: AppSize.sHeight * 0.04,
                      colorFilter: const ColorFilter.mode(
                        ColorManager.redColor,
                        BlendMode.srcIn,
                      ),
                    ),
                    const SizedBox(height: AppSize.s8),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppPadding.p14,
                      ),
                      child: Text(
                        "المفضلة",
                        style: Get.textTheme.bodyLarge!.copyWith(
                          color: ColorManager.redColor,
                          fontSize: FontSize.s16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CardUserInfo extends StatelessWidget {
  const CardUserInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ProfileController>();

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppPadding.p16,
        vertical: AppPadding.p12,
      ),
      child: Container(
        padding: const EdgeInsets.all(AppPadding.p14),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(AppSize.s30)),
          border: Border.all(color: ColorManager.cardHead, width: 2),
          color: ColorManager.cardHead.withAlpha(20),
        ),
        child: Row(
          children: [
            ClipOval(
              child: CustomCachedNetworkImage(
                imageUrl: controller.profileInfo!.photoUrl ?? '',
                height: AppSize.sHeight * 0.15,
                width: AppSize.sHeight * 0.15,
                fit: BoxFit.cover,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppPadding.p14,
                  ),
                  child: Text(
                    "اسم المستخدم:",
                    style: Get.textTheme.bodyLarge!.copyWith(
                      color: ColorManager.secColor,
                      fontSize: FontSize.s12,
                    ),
                  ),
                ),
                const SizedBox(height: AppSize.s4),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppPadding.p14,
                  ),
                  child: Text(
                    '${controller.profileInfo!.firstName} ${controller.profileInfo!.lastName}',
                    style: Get.textTheme.bodyLarge!.copyWith(
                      color: ColorManager.cardHead,
                      fontSize: FontSize.s14,
                    ),
                  ),
                ),
                const SizedBox(height: AppSize.s12),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppPadding.p14,
                  ),
                  child: Text(
                    "رقم الهاتف:",
                    style: Get.textTheme.bodyLarge!.copyWith(
                      color: ColorManager.secColor,
                      fontSize: FontSize.s12,
                    ),
                  ),
                ),
                const SizedBox(height: AppSize.s4),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppPadding.p14,
                  ),
                  child: Text(
                    controller.profileInfo!.phone,
                    style: Get.textTheme.bodyLarge!.copyWith(
                      color: ColorManager.cardHead,
                      fontSize: FontSize.s14,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
