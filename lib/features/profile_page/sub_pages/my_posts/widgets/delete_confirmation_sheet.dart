import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_ms/core/utils/color_manager.dart';
import 'package:property_ms/core/utils/values_manager.dart';
import 'package:property_ms/core/utils/widgets/app_button.dart';
import '../my_posts_controller.dart';

class DeleteConfirmationSheet extends StatelessWidget {
  final String postId;

  const DeleteConfirmationSheet({super.key, required this.postId});

  @override
  Widget build(BuildContext context) {
    return Container(
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
                  padding: const EdgeInsets.symmetric(vertical: AppPadding.p16),
                ),
              ),
              const SizedBox(width: AppSize.s12),
              Expanded(
                child: AppButton(
                  text: 'نعم، حذف',
                  onPressed: () {
                    Get.find<MyPostsController>().deletePost(postId);
                    Get.back();
                    Get.snackbar(
                      'تم الحذف',
                      'تم حذف المنشور بنجاح',
                      backgroundColor: ColorManager.redColor,
                      colorText: Colors.white,
                    );
                  },
                  backgroundColor: ColorManager.redColor,
                  fontColor: Colors.white,
                  fontWeight: FontWeight.bold,
                  radius: AppSize.s12,
                  padding: const EdgeInsets.symmetric(vertical: AppPadding.p16),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
