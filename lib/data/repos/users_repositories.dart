import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' as Get;
import 'package:property_ms/core/services/api/api_service.dart';
import 'package:property_ms/core/services/api/end_points.dart';
import 'package:property_ms/core/services/cache/cache_service.dart';
import 'package:property_ms/data/models/app_response.dart';

abstract class UsersRepositories {
  Future<AppResponse> register({
    required String firstName,
    required String lastName,
    required String phoneNumber,
    required String email,
    required String password,
    required String passwordConfirm,
  });
  Future<AppResponse> login({
    required String number,
    required String password,
    String fcm,
  });
  Future<AppResponse> logout();
  Future<AppResponse> forgatePassword({required String number});
  Future<AppResponse> uploadImage({required FormData image});
  Future<AppResponse> refreshToken();
  Future<AppResponse> currentUser();
  Future<AppResponse> getImage();
  Future<AppResponse> deleteImage();
  Future<AppResponse> checkToken();
  Future<AppResponse> generateVerificationCode({required String mumber});
}

// class ImpUsersRepositories implements UsersRepositories {
//   final cache = Get.Get.find<CacheService>();
//   final ApiService api;
//   ImpUsersRepositories({required this.api});

//   @override
//   Future<AppResponse> register({
//     required String firstName,
//     required String lastName,
//     required String phoneNumber,
//     required String email,
//     required String password,
//     required String passwordConfirm,
//   }) async {
//     AppResponse response = AppResponse(success: false);
//     try {
//       response.data = await api.request(
//         url: EndPoints.registerUrl,
//         method: Method.post,
//         requiredToken: false,
//         params: {
//           ApiKey.first_name: firstName,
//           ApiKey.last_name: lastName,
//           ApiKey.number: phoneNumber,
//           ApiKey.email: email,
//           ApiKey.password: password,
//           ApiKey.password_confirmation: passwordConfirm,
//         },
//       );
//       final data = jsonDecode(response.data.toString()) as Map<String, dynamic>;
//       response.data = data;
//       response.success = true;
//     } on ErrorHandler catch (e) {
//       response.networkFailure = e.failure;
//     }
//     return response;
//   }

//   @override
//   Future<AppResponse> login({
//     required String number,
//     required String password,
//     String? fcm,
//   }) async {
//     AppResponse response = AppResponse(success: false);
//     try {
//       response.data = await api.request(
//         url: EndPoints.loginUrl,
//         method: Method.post,
//         requiredToken: false,
//         params: {
//           ApiKey.number: number,
//           ApiKey.password: password,
//           "fcm_token": fcm,
//         },
//       );
//       debugPrint(response.data.toString());
//       final data = jsonDecode(response.data.toString()) as Map<String, dynamic>;
//       response.data = LoginEntitie.fromMap(data);
//       response.success = true;
//     } on ErrorHandler catch (e) {
//       response.networkFailure = e.failure;
//     }
//     return response;
//   }

//   @override
//   Future<AppResponse> logout() async {
//     AppResponse response = AppResponse(success: false);
//     try {
//       response.data = await api.request(
//         url: EndPoints.logoutUrl,
//         method: Method.post,
//         requiredToken: true,
//       );
//       final data = jsonDecode(response.data.toString()) as Map<String, dynamic>;
//       response.data = data[ApiKey.message];
//       response.success = true;
//     } on ErrorHandler catch (e) {
//       response.networkFailure = e.failure;
//     }
//     return response;
//   }

//   @override
//   Future<AppResponse> verifyNumber({
//     required String verify_code,
//     required int id,
//   }) async {
//     AppResponse response = AppResponse(success: false);
//     try {
//       response.data = await api.request(
//         url: EndPoints.verifyNumberUrl,
//         method: Method.post,
//         requiredToken: false,
//         params: {ApiKey.verify_code: verify_code, ApiKey.id: id},
//       );
//       final data = jsonDecode(response.data.toString()) as Map<String, dynamic>;
//       response.data = data[ApiKey.message];
//       response.success = true;
//     } on ErrorHandler catch (e) {
//       response.networkFailure = e.failure;
//     }
//     return response;
//   }

//   @override
//   Future<AppResponse> currentUser() async {
//     AppResponse response = AppResponse(success: false);
//     try {
//       response.data = await api.request(
//         url: EndPoints.currentUser,
//         method: Method.get,
//         requiredToken: true,
//       );
//       final data = jsonDecode(response.data.toString()) as Map<String, dynamic>;
//       response.data = GetUserEntitie.fromMap(data[ApiKey.user]);
//       response.success = true;
//     } on ErrorHandler catch (e) {
//       response.networkFailure = e.failure;
//     }
//     return response;
//   }

//   Future<AppResponse> userName() async {
//     AppResponse response = AppResponse(success: false);
//     try {
//       response.data = await api.request(
//         url: EndPoints.currentUser,
//         method: Method.get,
//         requiredToken: true,
//       );
//       final data = jsonDecode(response.data.toString()) as Map<String, dynamic>;
//       response.data = GetUserEntitie.fromMap(data[ApiKey.user]);
//       response.data = response.data.firstName + " " + response.data.lastName;
//       response.success = true;
//     } on ErrorHandler catch (e) {
//       response.networkFailure = e.failure;
//     }
//     return response;
//   }

//   @override
//   Future<AppResponse> deleteImage() {
//     // TODO: implement deleteImage
//     throw UnimplementedError();
//   }

//   @override
//   Future<AppResponse> editUser({
//     required String first_name,
//     required String last_name,
//     required String email,
//   }) async {
//     AppResponse response = AppResponse(success: false);
//     try {
//       response.data = await api.request(
//         url: EndPoints.editUser,
//         method: Method.put,
//         requiredToken: true,
//         params: {
//           ApiKey.first_name: first_name,
//           ApiKey.last_name: last_name,
//           ApiKey.email: email,
//         },
//       );
//       final data = jsonDecode(response.data.toString()) as Map<String, dynamic>;
//       response.data = EditUserEntitie.fromMap(data[ApiKey.user]);
//       response.success = true;
//     } on ErrorHandler catch (e) {
//       response.networkFailure = e.failure;
//     }
//     return response;
//   }

//   @override
//   Future<AppResponse> getImage() async {
//     AppResponse response = AppResponse(success: false);
//     try {
//       response.data = await api.request(
//         url: EndPoints.getImage,
//         method: Method.get,
//         requiredToken: true,
//       );
//       final data = jsonDecode(response.data.toString()) as Map<String, dynamic>;
//       response.data = data[ApiKey.image_path];
//       response.success = true;
//     } on ErrorHandler catch (e) {
//       response.networkFailure = e.failure;
//     }
//     return response;
//   }

//   @override
//   Future<AppResponse> refreshToken() {
//     // TODO: implement refreshToken
//     throw UnimplementedError();
//   }

//   @override
//   Future<AppResponse> resetPassword({
//     required String old_password,
//     required String new_password,
//     required String new_password_confirmation,
//   }) async {
//     AppResponse response = AppResponse(success: false);
//     try {
//       response.data = await api.request(
//         url: EndPoints.resetPassword,
//         method: Method.put,
//         requiredToken: true,
//         params: {
//           ApiKey.old_password: old_password,
//           ApiKey.new_password: new_password,
//           ApiKey.new_password_confirmation: new_password_confirmation,
//         },
//       );
//       final data = jsonDecode(response.data.toString()) as Map<String, dynamic>;
//       response.data = data[ApiKey.message];
//       response.success = true;
//     } on ErrorHandler catch (e) {
//       response.networkFailure = e.failure;
//     }
//     return response;
//   }

//   @override
//   Future<AppResponse> setPassword({
//     required int id,
//     required String password,
//     required String password_confirmation,
//   }) async {
//     AppResponse response = AppResponse(success: false);
//     try {
//       response.data = await api.request(
//         url: EndPoints.baserUrl + EndPoints.setPassword,
//         method: Method.put,
//         requiredToken: true,
//         params: {
//           ApiKey.id: id,
//           ApiKey.password: password,
//           ApiKey.password_confirmation: password_confirmation,
//         },
//       );
//       final data = jsonDecode(response.data.toString()) as Map<String, dynamic>;
//       response.data = data[ApiKey.message];
//       response.success = true;
//     } on ErrorHandler catch (e) {
//       response.networkFailure = e.failure;
//     }
//     return response;
//   }

//   @override
//   Future<AppResponse> uploadImage({required FormData image}) async {
//     AppResponse response = AppResponse(success: false);
//     try {
//       response.data = await api.request(
//         url: EndPoints.uploadImage,
//         method: Method.post,
//         requiredToken: true,
//         uploadImage: true,
//         params: image,
//       );
//       final data = jsonDecode(response.data.toString()) as Map<String, dynamic>;
//       response.data = data[ApiKey.message];
//       response.success = true;
//     } on ErrorHandler catch (e) {
//       response.networkFailure = e.failure;
//     }
//     return response;
//   }

//   @override
//   Future<AppResponse> verifyNewPassword({
//     required String verify_code,
//     required int id,
//   }) async {
//     AppResponse response = AppResponse(success: false);
//     try {
//       response.data = await api.request(
//         url: EndPoints.baserUrl + EndPoints.verifyNewPassword,
//         method: Method.post,
//         requiredToken: true,
//         params: {ApiKey.verify_code: verify_code, ApiKey.id: id},
//       );
//       final data = jsonDecode(response.data.toString()) as Map<String, dynamic>;
//       response.data = data[ApiKey.message];
//       response.success = true;
//     } on ErrorHandler catch (e) {
//       response.networkFailure = e.failure;
//     }
//     return response;
//   }

//   @override
//   Future<AppResponse> forgatePassword({required String number}) async {
//     AppResponse response = AppResponse(success: false);
//     try {
//       response.data = await api.request(
//         url: EndPoints.baserUrl + EndPoints.forgetPasswordUrl,
//         method: Method.post,
//         requiredToken: true,
//         params: {ApiKey.number: number},
//       );
//       final data = jsonDecode(response.data.toString()) as Map<String, dynamic>;
//       response.data = ForgetPasswordEntitie.fromMap(data);
//       response.success = true;
//     } on ErrorHandler catch (e) {
//       response.networkFailure = e.failure;
//     }
//     print(response);
//     return response;
//   }

//   @override
//   Future<AppResponse> generateVerificationCode({required String mumber}) async {
//     AppResponse response = AppResponse(success: false);
//     try {
//       response.data = await api.request(
//         url: EndPoints.generateVerificationCode,
//         method: Method.post,
//         requiredToken: false,
//       );
//       final data = jsonDecode(response.data.toString()) as Map<String, dynamic>;
//       response.data = data[ApiKey.message];
//       response.success = true;
//     } on ErrorHandler catch (e) {
//       response.networkFailure = e.failure;
//     }
//     return response;
//   }

//   @override
//   Future<AppResponse> checkToken() async {
//     AppResponse response = AppResponse(success: false);
//     try {
//       response.data = await api.request(
//         url: EndPoints.baserUrl + EndPoints.checkToken,
//         method: Method.get,
//         requiredToken: true,
//       );
//       final data = jsonDecode(response.data.toString()) as Map<String, dynamic>;
//       response.data = data[ApiKey.message];
//       response.success = true;
//     } on ErrorHandler catch (e) {
//       response.networkFailure = e.failure;
//     }
//     return response;
//   }
// }
