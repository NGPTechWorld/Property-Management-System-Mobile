import 'dart:io';

import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';
import 'package:property_ms/core/Routes/app_routes.dart';
import 'package:property_ms/core/services/api/api_service.dart';
import 'package:property_ms/core/services/api/end_points.dart';
import 'package:property_ms/core/services/cache/cache_service.dart';
import 'package:property_ms/core/services/errors/error_handler.dart';
import 'package:property_ms/core/utils/helper/extensions.dart';
import 'package:property_ms/data/dto/login_dto.dart';
import 'package:property_ms/data/dto/profile_dto.dart';
import 'package:property_ms/data/dto/register_dto.dart';
import 'package:property_ms/data/dto/user_invoice_dto.dart';
import 'package:property_ms/data/dto/user_purchases_dto.dart';
import 'package:property_ms/data/dto/user_reservation_dto.dart';
import 'package:property_ms/data/models/app_response.dart';
import 'package:property_ms/data/models/notification_model.dart';
import 'package:property_ms/data/models/paginated_model.dart';

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
  Future<AppResponse<List<NotificationModel>>> myNotifications();
  Future<AppResponse> resetPassword({
    required String email,
    required String newPassword,
  });
  Future<AppResponse<UserInvoiceDto>> getUserInvoice({required int id});
  Future<AppResponse<PaginatedModel<UserReservationDto>>> getUserReservation({
    required int items,
    required int page,
    required String type,
  });
  Future<AppResponse<PaginatedModel<UserPurchasesDto>>> getUserPurchases({
    required int items,
    required int page,
  });
  //! Profile
  Future<AppResponse<ProfileDto>> getUserProfileInfo();

  Future<AppResponse<ProfileDto>> updateUserProfile({
    String? firstName,
    String? lastName,
    String? email,
    String? phone,
    File? imagePath,
  });
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

  @override
  Future<AppResponse<PaginatedModel<UserReservationDto>>> getUserReservation({
    required int items,
    required int page,
    required String type,
  }) async {
    AppResponse<PaginatedModel<UserReservationDto>> appResponse = AppResponse(
      success: false,
    );

    try {
      dio.Response response = await apiService.request(
        url: EndPoints.userReservation,
        method: Method.get,
        requiredToken: true,
        withLogging: true,
        queryParameters: {"items": items, "page": page, "type": type},
      );
      appResponse.success = true;
      appResponse.successMessage = response.data['message'];
      appResponse.data = PaginatedModel<UserReservationDto>.fromJson(
        response.data,
        UserReservationDto.fromJson,
      );
    } catch (e) {
      appResponse.success = false;
      appResponse.networkFailure = ErrorHandler.handle(e).failure;
    }
    return appResponse;
  }

  @override
  Future<AppResponse<PaginatedModel<UserPurchasesDto>>> getUserPurchases({
    required int items,
    required int page,
  }) async {
    AppResponse<PaginatedModel<UserPurchasesDto>> appResponse = AppResponse(
      success: false,
    );

    try {
      dio.Response response = await apiService.request(
        url: EndPoints.userMyPurchases,
        method: Method.get,
        requiredToken: true,
        withLogging: true,
        queryParameters: {"items": items, "page": page},
      );
      appResponse.success = true;
      appResponse.successMessage = response.data['message'];
      appResponse.data = PaginatedModel<UserPurchasesDto>.fromJson(
        response.data,
        UserPurchasesDto.fromJson,
      );
    } catch (e) {
      appResponse.success = false;
      appResponse.networkFailure = ErrorHandler.handle(e).failure;
    }
    return appResponse;
  }

  @override
  Future<AppResponse<UserInvoiceDto>> getUserInvoice({required int id}) async {
    AppResponse<UserInvoiceDto> appResponse = AppResponse(success: false);
    try {
      dio.Response response = await apiService.request(
        url: EndPoints.userInvoice + id.toString(),
        method: Method.get,
        requiredToken: true,
        withLogging: true,
      );
      appResponse.success = true;
      appResponse.successMessage = response.data['message'];
      appResponse.data = UserInvoiceDto.fromJson(response.data['data']);
    } catch (e) {
      appResponse.success = false;
      appResponse.networkFailure = ErrorHandler.handle(e).failure;
    }
    return appResponse;
  }

  @override
  Future<AppResponse<List<NotificationModel>>> myNotifications() async {
    AppResponse<List<NotificationModel>> appResponse = AppResponse(
      success: false,
    );
    try {
      dio.Response response = await apiService.request(
        url: EndPoints.notifications,
        method: Method.get,
        requiredToken: true,
        withLogging: true,
      );
      appResponse.success = true;
      appResponse.successMessage = response.data['message'];
      appResponse.data =
          (response.data["data"] as List<dynamic>? ?? [])
              .map(
                (item) =>
                    NotificationModel.fromJson(item as Map<String, dynamic>),
              )
              .toList();
    } catch (e) {
      appResponse.success = false;
      appResponse.networkFailure = ErrorHandler.handle(e).failure;
    }
    return appResponse;
  }

  //! Profile
  @override
  Future<AppResponse<ProfileDto>> getUserProfileInfo() async {
    AppResponse<ProfileDto> appResponse = AppResponse(success: false);
    try {
      dio.Response response = await apiService.request(
        url: EndPoints.userProfileInfo,
        method: Method.get,
        requiredToken: true,
        withLogging: true,
      );

      appResponse.success = true;
      appResponse.successMessage = response.data['message'];
      appResponse.data = ProfileDto.fromJson(response.data['data']);
    } catch (e) {
      appResponse.success = false;
      appResponse.networkFailure = ErrorHandler.handle(e).failure;
    }
    return appResponse;
  }

  @override
  Future<AppResponse<ProfileDto>> updateUserProfile({
    String? firstName,
    String? lastName,
    String? email,
    String? phone,
    File? imagePath,
  }) async {
    AppResponse<ProfileDto> appResponse = AppResponse(success: false);

    try {
      final Map<String, dynamic> data = {};

      if (firstName != null) data["first_name"] = firstName;
      if (lastName != null) data["last_name"] = lastName;
      if (email != null) data["email"] = email;
      if (phone != null) data["phone"] = phone;
      if (imagePath != null) {
        final profileMultipart = await imagePath.toMultipartFile1();
        if (profileMultipart != null) data["photo"] = profileMultipart;
      }

      final formData = dio.FormData.fromMap(data);

      final response = await apiService.request(
        url: EndPoints.userProfileInfo,
        method: Method.post,
        params: formData,
        requiredToken: true,
        withLogging: true,
        uploadImage: true,
      );

      appResponse.success = true;
      appResponse.successMessage = response.data['message'];
      appResponse.data = ProfileDto.fromJson(response.data['data']);
    } catch (e) {
      appResponse.success = false;
      appResponse.networkFailure = ErrorHandler.handle(e).failure;
    }

    return appResponse;
  }
}
