import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_ms/core/utils/assets.gen.dart';
import 'package:property_ms/core/utils/color_manager.dart';
import 'package:property_ms/data/models/app_response.dart';
import 'package:property_ms/data/repos/favorite_repositories.dart';

//! Controller
class FavoriteIconController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final int propertyId;
  final FavoriteRepositories favoriteRepo;

  FavoriteIconController({
    required this.propertyId,
    required this.favoriteRepo,
    bool initialIsFavorite = false,
  }) {
    isFavorite.value = initialIsFavorite;
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
  }

  late AnimationController _controller;
  AnimationController get controller => _controller;

  var isFavorite = false.obs;
  var loading = false.obs;

  Future<void> toggleFavorite() async {
    if (loading.value) return;
    loading.value = true;

    _controller.forward(from: 0);

    AppResponse response;
    if (isFavorite.value) {
      response = await favoriteRepo.removeFavorite(propertyId: propertyId);
    } else {
      response = await favoriteRepo.addFavorite(propertyId: propertyId);
    }

    if (response.success) {
      isFavorite.value = !isFavorite.value;
    } else {
      Get.snackbar('خطأ', response.networkFailure?.message ?? "فشل العملية");
    }

    loading.value = false;
  }

  @override
  void onClose() {
    _controller.dispose();
    super.onClose();
  }
}

//! Button UI
class FavoriteIconButton extends StatelessWidget {
  final int propertyId;
  final bool initialIsFavorite;
  final double size;
  final double iconSize;

  const FavoriteIconButton({
    super.key,
    required this.propertyId,
    this.initialIsFavorite = false,
    this.size = 32,
    this.iconSize = 16,
  });

  @override
  Widget build(BuildContext context) {
    final FavoriteIconController controller = Get.put(
      FavoriteIconController(
        propertyId: propertyId,
        favoriteRepo: Get.find<FavoriteRepositories>(),
        initialIsFavorite: initialIsFavorite,
      ),
      tag: propertyId.toString(),
    );

    return Obx(
      () => GestureDetector(
        onTap: controller.toggleFavorite,
        child: Container(
          width: size,
          height: size,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: ColorManager.cardBackground,
          ),
          child: Center(
            child:
                controller.loading.value
                    ? const SizedBox(
                      width: 16,
                      height: 16,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                    : RotationTransition(
                      turns: Tween(begin: 0.0, end: 1.0).animate(
                        CurvedAnimation(
                          parent: controller.controller,
                          curve: Curves.easeInOut,
                        ),
                      ),
                      child: Assets.icons.favoriteFillIcon.svg(
                        width: iconSize,
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
    );
  }
}
