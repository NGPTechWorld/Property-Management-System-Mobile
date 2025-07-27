import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';
import 'package:property_ms/core/services/api/api_service.dart';
import 'package:property_ms/core/services/api/end_points.dart';
import 'package:property_ms/core/services/cache/cache_service.dart';
import 'package:property_ms/core/services/errors/error_handler.dart';
import 'package:property_ms/data/dto/office_dto.dart';
import 'package:property_ms/data/models/app_response.dart';
import 'package:property_ms/data/models/paginated_model.dart';

abstract class OfficesRepositories {
  Future<AppResponse<PaginatedModel<OfficeDto>>> getTopRateOffice({
    required int perPage,
    required int page,
  });
}

class ImpOfficesRepositories extends GetxService
    implements OfficesRepositories {
  ApiService apiService = Get.find<ApiService>();
  CacheService cacheService = Get.find<CacheService>();
  ImpOfficesRepositories();

  @override
  Future<AppResponse<PaginatedModel<OfficeDto>>> getTopRateOffice({
    required int perPage,
    required int page,
  }) async {
    AppResponse<PaginatedModel<OfficeDto>> appResponse = AppResponse(
      success: false,
    );

    try {
      dio.Response response = await apiService.request(
        url: EndPoints.getTopRateOffice,
        method: Method.get,
        requiredToken: true,
        withLogging: true,
        queryParameters: {"items": perPage, "page": page},
      );
      appResponse.success = true;
      appResponse.data = PaginatedModel<OfficeDto>.fromJson(
        response.data,
        OfficeDto.fromJson,
      );
    } catch (e) {
      appResponse.success = false;
      appResponse.networkFailure = ErrorHandler.handle(e).failure;
    }
    return appResponse;
  }
}
