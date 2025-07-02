import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:property_ms/core/utils/assets.gen.dart';
import 'package:property_ms/core/utils/color_manager.dart';
import 'package:property_ms/core/utils/values_manager.dart';
import 'main_controller.dart';

class MainPage extends GetView<MainController> {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          PageView(
            physics: const NeverScrollableScrollPhysics(),
            onPageChanged: (pageIndex) {
              controller.pageIndex.value = pageIndex;
            },
            controller: controller.pageController,
            children: controller.pages,
          ),
        ],
      ),
      bottomNavigationBar: const MainPageNavBar(),
    );
  }
}

class MainPageNavBar extends GetView<MainController> {
  const MainPageNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final navBarHeight = AppSize.sHeight * 0.1;

    return Obx(() {
      return AnimatedSwitcher(
        duration: const Duration(milliseconds: 500),
        switchInCurve: Curves.easeOut,
        switchOutCurve: Curves.easeIn,
        transitionBuilder: (child, animation) {
          return SizeTransition(
            sizeFactor: animation,
            axisAlignment: -1.0,
            child: child,
          );
        },
        child: ClipRRect(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
          child: BottomNavigationBar(
            backgroundColor: ColorManager.whiteColor,
            currentIndex: controller.pageIndex.value,
            onTap: (index) => controller.changePage(index),
            items:
                [
                  NavBarItem('home'.tr, Assets.icons.homeIcon),
                  NavBarItem('offices'.tr, Assets.icons.shopIcon),
                  NavBarItem('ecploration'.tr, Assets.icons.shopIcon),
                  NavBarItem('reservation'.tr, Assets.icons.adsIcon),
                  NavBarItem('profile'.tr, Assets.icons.userAccountIcon),
                ].asMap().entries.map((item) {
                  return BottomNavigationBarItem(
                    icon: Padding(
                      padding: const EdgeInsets.only(
                        top: AppPadding.p6,
                        bottom: AppPadding.p6,
                      ),
                      child:
                          item.value.icon?.svg(
                            width: AppSize.s26,
                            colorFilter: ColorFilter.mode(
                              controller.pageIndex.value == item.key
                                  ? ColorManager.primaryColor
                                  : ColorManager.primary5Color,
                              BlendMode.srcIn,
                            ),
                          ) ??
                          SizedBox(height: AppSize.sHeight * 0.025),
                    ),
                    label: item.value.name,
                  );
                }).toList(),
          ),
        ),
      );
    });
  }
}
