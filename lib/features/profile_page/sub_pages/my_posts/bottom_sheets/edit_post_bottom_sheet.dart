import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_ms/core/utils/color_manager.dart';
import 'package:property_ms/core/utils/values_manager.dart';
import 'package:property_ms/features/profile_page/sub_pages/my_posts/widgets/post_form.dart';
import '../my_posts_controller.dart';

class EditPostBottomSheet extends StatelessWidget {
  final PostModel post;

  EditPostBottomSheet({super.key, required this.post});

  final _formKey = GlobalKey<FormState>();

  late final TextEditingController _locationController = TextEditingController(
    text: post.location,
  );
  late final TextEditingController _descriptionController =
      TextEditingController(text: post.description);
  late final TextEditingController _priceController = TextEditingController(
    text: post.price.toString(),
  );
  final RxString _propertyType = ''.obs;

  @override
  Widget build(BuildContext context) {
    _propertyType.value = post.propertyType;

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
          onSubmit: _handleUpdate,
          submitLabel: 'تحديث المنشور',
        ),
      ),
    );
  }

  void _handleUpdate() {
    if (_formKey.currentState!.validate()) {
      final updatedPost = post.copyWith(
        location: _locationController.text,
        description: _descriptionController.text,
        price: double.parse(_priceController.text),
        propertyType: _propertyType.value,
        date: DateTime.now(),
      );

      Get.find<MyPostsController>().updatePost(updatedPost);
      Get.back();
      Get.snackbar(
        'تم التحديث',
        'تم تحديث المنشور بنجاح',
        backgroundColor: ColorManager.primaryColor,
        colorText: Colors.white,
      );
    }
  }
}
