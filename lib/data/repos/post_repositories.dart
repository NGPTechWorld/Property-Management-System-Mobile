import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';
import 'package:property_ms/core/services/api/api_service.dart';
import 'package:property_ms/core/services/api/end_points.dart';
import 'package:property_ms/core/services/cache/cache_service.dart';
import 'package:property_ms/core/services/errors/error_handler.dart';
import 'package:property_ms/data/dto/post_dto.dart';
import 'package:property_ms/data/dto/property_dto.dart';
import 'package:property_ms/data/models/app_response.dart';
import 'package:property_ms/data/models/paginated_model.dart';

abstract class PostRepositories {
  Future<AppResponse<List<PostDto>>> getAllUserPosts();

  Future<AppResponse> deletePost({required int postId});

  Future<AppResponse> createUserPost({
    required String title,
    required double budget,
    required String type,
    required String description,
    required int regionId,
  });

  Future<AppResponse<PaginatedModel<PropertyDto>>>
  getUserSuggestionsProperties({
    required int items,
    required int page,
    required int postId,
  });
}

class ImpPostRepositories extends GetxService implements PostRepositories {
  ApiService apiService = Get.find<ApiService>();
  CacheService cacheService = Get.find<CacheService>();
  ImpPostRepositories();

  @override
  Future<AppResponse<List<PostDto>>> getAllUserPosts() async {
    AppResponse<List<PostDto>> appResponse = AppResponse(success: false);
    try {
      dio.Response response = await apiService.request(
        url: EndPoints.userPost,
        method: Method.get,
        requiredToken: true,
        withLogging: true,
      );
      appResponse.success = true;
      appResponse.successMessage = response.data['message'];
      appResponse.data =
          (response.data['data'] as List)
              .map((e) => PostDto.fromJson(e))
              .toList();
    } catch (e) {
      appResponse.success = false;
      appResponse.networkFailure = ErrorHandler.handle(e).failure;
    }
    return appResponse;
  }

  @override
  Future<AppResponse> deletePost({required int postId}) async {
    AppResponse appResponse = AppResponse(success: false);
    try {
      dio.Response response = await apiService.request(
        url: "${EndPoints.deletePost}$postId",
        method: Method.delete,
        requiredToken: true,
        withLogging: true,
      );
      appResponse.success = true;
      appResponse.successMessage = response.data['message'];
      appResponse.data = response.data['data'];
    } catch (e) {
      appResponse.success = false;
      appResponse.networkFailure = ErrorHandler.handle(e).failure;
    }
    return appResponse;
  }

  @override
  Future<AppResponse> createUserPost({
    required String title,
    required double budget,
    required String type,
    required String description,
    required int regionId,
  }) async {
    AppResponse appResponse = AppResponse(success: false);

    try {
      dio.Response response = await apiService.request(
        url: EndPoints.userPost,
        method: Method.post,
        requiredToken: true,
        withLogging: true,
        params: {
          "title": title,
          "budget": budget,
          "type": type,
          "description": description,
          "region_id": regionId,
        },
      );

      appResponse.success = true;
      appResponse.successMessage = response.data['message'];
      appResponse.data = response.data['data'];
    } catch (e) {
      appResponse.success = false;
      appResponse.networkFailure = ErrorHandler.handle(e).failure;
    }
    return appResponse;
  }

  @override
  Future<AppResponse<PaginatedModel<PropertyDto>>>
  getUserSuggestionsProperties({
    required int items,
    required int page,
    required int postId,
  }) async {
    AppResponse<PaginatedModel<PropertyDto>> appResponse = AppResponse(
      success: false,
    );

    try {
      dio.Response response = await apiService.request(
        url: EndPoints.userPostOnly + postId.toString() + EndPoints.suggestions,
        method: Method.get,
        requiredToken: true,
        withLogging: true,
        queryParameters: {"items": items, "page": page, "id": postId},
      );
      appResponse.success = true;
      appResponse.successMessage = response.data['message'];
      appResponse.data = PaginatedModel<PropertyDto>.fromJson(
        response.data,
        PropertyDto.fromJson,
      );
    } catch (e) {
      appResponse.success = false;
      appResponse.networkFailure = ErrorHandler.handle(e).failure;
    }
    return appResponse;
  }
}
