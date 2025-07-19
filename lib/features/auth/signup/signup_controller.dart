import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:property_ms/core/routes/app_routes.dart';
import 'package:property_ms/core/utils/helper/app_functions.dart';
import 'package:property_ms/core/utils/widgets/custom_toasts.dart';
import 'package:property_ms/data/dto/register_dto.dart';
import 'package:property_ms/data/enums/loading_state_enum.dart';
import 'package:property_ms/data/repos/users_repositories.dart';

class SignupController extends GetxController {
  final UsersRepositories userRepo = Get.find<UsersRepositories>();
  final loadingState = LoadingState.idle.obs;
  //
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

  Future<void> register() async {
    if (!formKeyStep2.currentState!.validate()) return;
    if (loadingState.value == LoadingState.loading) return;
    loadingState.value = LoadingState.loading;

    final RegisterDto data = RegisterDto(
      firstName: firstNameController.text,
      lastName: lastNameController.text,
      phoneNumber: phoneNumberController.text,
      email: emailController.text,
      password: passwordController.text,
    );

    final response = await userRepo.register(user: data);

    if (!response.success) {
      loadingState.value = LoadingState.hasError;
      CustomToasts(
        message: response.getErrorMessage(),
        type: CustomToastType.error,
      ).show();
      return;
    }
    CustomToasts(
      message: response.successMessage!,
      type: CustomToastType.success,
    ).show();
    Get.toNamed(
      AppRoutes.otpRoute,
      arguments: {'type': "signup", "email": emailController.text},
    );
    loadingState.value = LoadingState.doneWithData;
  }
}
