import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_ms/core/Routes/app_routes.dart';
import 'package:property_ms/core/services/cache/cache_keys.dart';
import 'package:property_ms/core/services/cache/cache_service.dart';
import 'package:property_ms/core/utils/widgets/custom_toasts.dart';
import 'package:property_ms/data/enums/loading_state_enum.dart';
import 'package:property_ms/data/repos/users_repositories.dart';

class LoginController extends GetxController {
  final UsersRepositories userRepo = Get.find<UsersRepositories>();
  final CacheService cacheService = Get.find<CacheService>();
  //
  final formKey = GlobalKey<FormState>();
  final loadingState = LoadingState.idle.obs;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final isPasswordHidden = true.obs;

  Future<void> login() async {
    if (!formKey.currentState!.validate()) return;
    if (loadingState.value == LoadingState.loading) return;
    loadingState.value = LoadingState.loading;

    final response = await userRepo.login(
      email: emailController.text,
      password: passwordController.text,
    );

    if (!response.success) {
      log(response.networkFailure!.code.toString());
      loadingState.value = LoadingState.hasError;
      CustomToasts(
        message: response.getErrorMessage(),
        type: CustomToastType.error,
      ).show();
      if (response.networkFailure!.code == 403) {
        Get.toNamed(
          AppRoutes.otpRoute,
          arguments: {
            'type': "signup",
            "email": emailController.text,
            "isLoginPage": true,
          },
        );
      }
      return;
    }

    CustomToasts(
      message: response.successMessage!,
      type: CustomToastType.success,
    ).show();

    cacheService.saveData(key: kUserToken, value: response.data!.accessToken);
    Get.offAllNamed(AppRoutes.splashRoute);
    loadingState.value = LoadingState.doneWithData;
  }
}
