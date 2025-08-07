import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';
import 'package:property_ms/core/services/api/api_service.dart';
import 'package:property_ms/core/services/api/end_points.dart';
import 'package:property_ms/core/services/cache/cache_service.dart';
import 'package:property_ms/core/services/errors/error_handler.dart';
import 'package:property_ms/data/models/app_response.dart';
import 'package:property_ms/data/models/paginated_model.dart';

abstract class FavoriteRepositories {
  Future<AppResponse<PaginatedModel<T>>> getFavorites<T>({
    required int perPage,
    required int page,
    required String type,
    required T Function(Map<String, dynamic>) fromJson,
  });

  // Future<AppResponse> addFavorite({required int propertyId });
  // Future<AppResponse> removeFavorite({required int propertyId });
}

class ImpFavoriteRepositories extends GetxService
    implements FavoriteRepositories {
  ApiService apiService = Get.find<ApiService>();
  CacheService cacheService = Get.find<CacheService>();
  ImpFavoriteRepositories();

  @override
  Future<AppResponse<PaginatedModel<T>>> getFavorites<T>({
    required int perPage,
    required int page,
    required String type,
    required T Function(Map<String, dynamic>) fromJson,
  }) async {
    AppResponse<PaginatedModel<T>> appResponse = AppResponse(success: false);
    try {
      dio.Response response = await apiService.request(
        url: EndPoints.getFavorites,
        method: Method.get,
        requiredToken: true,
        withLogging: true,
        queryParameters: {"items": perPage, "page": page, 'type': type},
      );
      appResponse.success = true;
      appResponse.successMessage = response.data['message'];
      appResponse.data = PaginatedModel<T>.fromJson(response.data, fromJson);
    } catch (e) {
      Get.snackbar('Error in FavoriteRepositories', e.toString());
      appResponse.success = false;
      appResponse.networkFailure = ErrorHandler.handle(e).failure;
    }
    return appResponse;
  }
}
