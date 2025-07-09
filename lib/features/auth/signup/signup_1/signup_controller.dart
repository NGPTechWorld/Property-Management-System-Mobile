import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:property_ms/core/utils/helper/app_functions.dart';

class SignupController extends GetxController {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final phoneNumberController = TextEditingController();
  // Make the image observable
  Rx<XFile?> image = Rx<XFile?>(null);

  void pickImage() async {
    final picked = await AppFunctions.imagePicker(ImageSource.gallery);
    image.value = picked;
  }
}
