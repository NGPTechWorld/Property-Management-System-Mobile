import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_ms/core/routes/app_routes.dart';
import 'package:property_ms/core/utils/widgets/custom_toasts.dart';
import 'package:property_ms/data/enums/loading_state_enum.dart';
import 'package:property_ms/data/repos/users_repositories.dart';

class ResetPasswordController extends GetxController {
  final UsersRepositories userRepo = Get.find<UsersRepositories>();
  final loadingState = LoadingState.idle.obs;

  String? email;

  final formKey = GlobalKey<FormState>();
  final passwordController = TextEditingController();
  final verificationPasswordController = TextEditingController();
  final isPasswordHidden = true.obs;
  final isVerifectionPasswordHidden = true.obs;

  //! Overrides
  @override
  void onInit() {
    super.onInit();
    final args = Get.arguments;
    email = args?['email'];
  }

  //! Functions
  Future<void> resetPassword() async {
    if (!formKey.currentState!.validate()) return;
    if (loadingState.value == LoadingState.loading) return;
    loadingState.value = LoadingState.loading;
    final response = await userRepo.resetPassword(
      email: email!,
      newPassword: passwordController.text,
    );
    if (!response.success) {
      loadingState.value = LoadingState.hasError;
      CustomToasts(
        message: response.getErrorMessage(),
        type: CustomToastType.error,
      ).show();
      return;
    }
    Get.offAllNamed(AppRoutes.loginRoute);
    CustomToasts(
      message: response.successMessage!,
      type: CustomToastType.success,
    ).show();
    // Here should be this if otp
    //  Get.toNamed(
    //   AppRoutes.otpRoute,
    //   arguments: {'type': "signup", "email": emailController.text},
    // );
    loadingState.value = LoadingState.doneWithData;
  }
}
