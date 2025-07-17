import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:property_ms/core/routes/app_routes.dart';
import 'package:property_ms/core/utils/helper/app_functions.dart';

class SignupController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final formKeyStep2 = GlobalKey<FormState>();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final phoneNumberController = TextEditingController();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final verifectionPasswordController = TextEditingController();
  final isPasswordHidden = true.obs;
  final isVerifectionPasswordHidden = true.obs;
  // Make the image observable
  Rx<XFile?> image = Rx<XFile?>(null);

  void pickImage() async {
    final picked = await AppFunctions.imagePicker(ImageSource.gallery);
    image.value = picked;
  }

  nextStep2() {
    if (!formKey.currentState!.validate()) return;
    Get.toNamed(AppRoutes.signUp2Route);
  }

  nextDone() {
    if (!formKeyStep2.currentState!.validate()) return;
    Get.toNamed(AppRoutes.otpRoute);
  }
}
