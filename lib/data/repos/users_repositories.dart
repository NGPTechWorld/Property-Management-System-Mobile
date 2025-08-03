import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';
import 'package:property_ms/core/Routes/app_routes.dart';
import 'package:property_ms/core/services/api/api_service.dart';
import 'package:property_ms/core/services/api/end_points.dart';
import 'package:property_ms/core/services/cache/cache_service.dart';
import 'package:property_ms/core/services/errors/error_handler.dart';
import 'package:property_ms/data/dto/login_dto.dart';
import 'package:property_ms/data/dto/register_dto.dart';
import 'package:property_ms/data/models/app_response.dart';

abstract class UsersRepositories {
  Future<AppResponse> register({required RegisterDto user});
  Future<AppResponse<LoginDto>> login({
    required String email,
    required String password,
    String fcm,
  });
  Future<AppResponse> resentOtp({
    required String email,
    required String type,
  }); // Type = reset or signup
  Future<AppResponse> confirem({required String email, required String otp});
  Future<AppResponse> resetPassword({
    required String email,
    required String newPassword,
  });
  // Future<AppResponse> logout();
  // Future<AppResponse> forgatePassword({required String number});
  // Future<AppResponse> uploadImage({required FormData image});
  // Future<AppResponse> currentUser();
}

class ImpUsersRepositories extends GetxService implements UsersRepositories {
  ApiService apiService = Get.find<ApiService>();
  CacheService cacheService = Get.find<CacheService>();
  ImpUsersRepositories();

  var userLoggedIn = false.obs;

  Future<bool> checkLoggedInAndShowDialog() async {
    bool isLoggedIn = userLoggedIn.value;
    if (!isLoggedIn) {
      await Get.toNamed(AppRoutes.loginRoute);
    }
    isLoggedIn = userLoggedIn.value;
    return isLoggedIn;
  }

  @override
  Future<AppResponse<LoginDto>> login({
    required String email,
    required String password,
    String? fcm,
  }) async {
    AppResponse<LoginDto> appResponse = AppResponse(success: false);
    try {
      final response = await apiService.request(
        url: EndPoints.login,
        method: Method.post,
        params: {"email": email, "password": password},
        requiredToken: false,
        withLogging: true,
      );
      appResponse.success = true;
      appResponse.successMessage = response.data['message'];
      appResponse.data = LoginDto.fromMap(response.data['data']);
    } catch (e) {
      appResponse.success = false;
      appResponse.networkFailure = ErrorHandler.handle(e).failure;
    }
    return appResponse;
  }

  @override
  Future<AppResponse> register({required RegisterDto user}) async {
    AppResponse appResponse = AppResponse(success: false);
    try {
      final data = dio.FormData.fromMap(await user.toJson());
      final response = await apiService.request(
        url: EndPoints.signup,
        method: Method.post,
        params: data,
        requiredToken: false,
        withLogging: true,
        uploadImage: true,
      );
      appResponse.success = true;
      appResponse.successMessage = response.data['message'];
    } catch (e) {
      appResponse.success = false;
      appResponse.networkFailure = ErrorHandler.handle(e).failure;
    }
    return appResponse;
  }

  @override
  Future<AppResponse> confirem({
    required String email,
    required String otp,
  }) async {
    AppResponse appResponse = AppResponse(success: false);
    try {
      final response = await apiService.request(
        url: EndPoints.confirm,
        method: Method.post,
        params: {"email": email, "otp": otp},
        requiredToken: false,
        withLogging: true,
      );
      appResponse.success = true;
      appResponse.successMessage = response.data['message'];
    } catch (e) {
      appResponse.success = false;
      appResponse.networkFailure = ErrorHandler.handle(e).failure;
    }
    return appResponse;
  }

  @override
  Future<AppResponse> resentOtp({
    required String email,
    required String type,
  }) async {
    AppResponse appResponse = AppResponse(success: false);
    try {
      final response = await apiService.request(
        url: EndPoints.resendOtp,
        method: Method.post,
        params: {"email": email, "type": type},
        requiredToken: false,
        withLogging: true,
      );
      appResponse.success = true;
      appResponse.successMessage = response.data['message'];
    } catch (e) {
      appResponse.success = false;
      appResponse.networkFailure = ErrorHandler.handle(e).failure;
    }
    return appResponse;
  }

  @override
  Future<AppResponse> resetPassword({
    required String email,
    required String newPassword,
  }) async {
    AppResponse appResponse = AppResponse(success: false);
    try {
      final response = await apiService.request(
        url: EndPoints.resetPassword,
        method: Method.post,
        params: {"email": email, "password": newPassword},
        requiredToken: false,
        withLogging: true,
      );
      appResponse.success = true;
      appResponse.successMessage = response.data['message'];
    } catch (e) {
      appResponse.success = false;
      appResponse.networkFailure = ErrorHandler.handle(e).failure;
    }
    return appResponse;
  }
}
