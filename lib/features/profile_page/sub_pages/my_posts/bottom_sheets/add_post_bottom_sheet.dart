import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_ms/core/utils/color_manager.dart';
import 'package:property_ms/core/utils/values_manager.dart';
import 'package:property_ms/core/utils/widgets/custom_toasts.dart';
import 'package:property_ms/features/profile_page/sub_pages/my_posts/bottom_sheets/widgets/post_form.dart';

import '../my_posts_controller.dart';

class AddPostBottomSheet extends StatelessWidget {
  AddPostBottomSheet({super.key});

  final _formKey = GlobalKey<FormState>();
  final _locationController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _priceController = TextEditingController();
  final _propertyType = "أجار".obs;
  // final _governorate = ''.obs;
  // final _regionId = 0.obs;

  void _handleSubmit() async {
    if (_formKey.currentState!.validate()) {
      final controller = Get.find<MyPostsController>();
      await controller.postRepo.createUserPost(
        title: "طلب شراء عقار",
        budget: double.parse(_priceController.text),
        type: _propertyType.value,
        description: _descriptionController.text,
        regionId: controller.selectedRegionId.value,
      );
      Get.back();
      await controller.refreshPage();
      const CustomToasts(
        message: 'تم إضافة المنشور بنجاح',
        type: CustomToastType.success,
      ).show();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppPadding.p16),
      decoration: const BoxDecoration(
        color: ColorManager.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(AppSize.s24),
          topRight: Radius.circular(AppSize.s24),
        ),
      ),
      child: Obx(
        () => PostForm(
          formKey: _formKey,
          locationController: _locationController,
          descriptionController: _descriptionController,
          priceController: _priceController,
          propertyType: _propertyType.value,
          onTypeChanged: (val) {
            if (val != null) _propertyType.value = val;
          },
          onSubmit: _handleSubmit,
          submitLabel: 'إضافة المنشور',
        ),
      ),
    );
  }
}
