import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:property_ms/core/utils/helper/app_functions.dart';

class AccountInfoController extends GetxController {
  final formKey = GlobalKey<FormState>();

  Rx<XFile?> profileImage = Rx<XFile?>(null);
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final emailController = TextEditingController();

  final isEdit = false.obs;
  //! Helper Func
  void pickImage() async {
    if (isEdit.value) {
      final picked = await AppFunctions.imagePicker(ImageSource.gallery);
      profileImage.value = picked;
    }
  }

  save() {
    isEdit.value = !isEdit.value;
  }
}
