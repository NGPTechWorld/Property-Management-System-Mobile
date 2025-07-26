import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_ms/core/utils/color_manager.dart';
import 'package:property_ms/core/utils/values_manager.dart';
import 'package:property_ms/features/profile_page/sub_pages/my_posts/widgets/post_form.dart';
import '../my_posts_controller.dart';

class AddPostBottomSheet extends StatelessWidget {
  AddPostBottomSheet({super.key});

  final _formKey = GlobalKey<FormState>();
  final _locationController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _priceController = TextEditingController();
  final _propertyType = "إيجار".obs;

  void _handleSubmit() {
    if (_formKey.currentState!.validate()) {
      final newPost = PostModel(
        id: '',
        location: _locationController.text,
        description: _descriptionController.text,
        price: double.parse(_priceController.text),
        propertyType: _propertyType.value,
        date: DateTime.now(),
      );
      Get.find<MyPostsController>().addPost(newPost);
      Get.back();
      Get.snackbar(
        'تمت الإضافة',
        'تم إضافة المنشور بنجاح',
        backgroundColor: ColorManager.primaryColor,
        colorText: Colors.white,
      );
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
