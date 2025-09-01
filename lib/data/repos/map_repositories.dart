import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';
import 'package:property_ms/core/services/api/api_service.dart';
import 'package:property_ms/core/services/api/end_points.dart';
import 'package:property_ms/core/services/cache/cache_service.dart';
import 'package:property_ms/core/services/errors/error_handler.dart';
import 'package:property_ms/data/models/app_response.dart';
import 'package:property_ms/data/models/marker_model.dart';

abstract class MapRepositories {
  Future<AppResponse<List<MarkerModel>>> explore({
    required double minLat,
    required double maxLat,
    required double minLng,
    required double maxLng,
  });
}

class ImpMapRepositories extends GetxService implements MapRepositories {
  ApiService apiService = Get.find<ApiService>();
  CacheService cacheService = Get.find<CacheService>();
  ImpMapRepositories();

  @override
  Future<AppResponse<List<MarkerModel>>> explore({
    required double minLat,
    required double maxLat,
    required double minLng,
    required double maxLng,
  }) async {
    AppResponse<List<MarkerModel>> appResponse = AppResponse(success: false);
    try {
      dio.Response response = await apiService.request(
        url: EndPoints.mapExplore,
        method: Method.get,
        requiredToken: false,
        withLogging: true,
        queryParameters: {
          "minLat": minLat,
          "maxLat": maxLat,
          "minLng": minLng,
          "maxLng": maxLng,
        },
      );
      appResponse.success = true;
      appResponse.successMessage = response.data['message'];
      appResponse.data =
          (response.data["data"] as List<dynamic>? ?? [])
              .map((item) => MarkerModel.fromJson(item as Map<String, dynamic>))
              .toList();
    } catch (e) {
      appResponse.success = false;
      appResponse.networkFailure = ErrorHandler.handle(e).failure;
    }
    return appResponse;
  }
}
