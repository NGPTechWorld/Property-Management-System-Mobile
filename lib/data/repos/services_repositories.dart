import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';
import 'package:property_ms/core/services/api/api_service.dart';
import 'package:property_ms/core/services/api/end_points.dart';
import 'package:property_ms/core/services/cache/cache_service.dart';
import 'package:property_ms/core/services/errors/error_handler.dart';
import 'package:property_ms/data/dto/property_dto.dart';
import 'package:property_ms/data/dto/service_dto.dart';
import 'package:property_ms/data/models/app_response.dart';
import 'package:property_ms/data/models/paginated_model.dart';
import 'package:property_ms/data/models/service_model.dart';

abstract class ServicesRepositories {
  Future<AppResponse<ServiceModel>> getService({required int id});
  Future<AppResponse<PaginatedModel<ServiceDto>>> getTopRateService({
    required int perPage,
    required int page,
  });
  Future<AppResponse<PaginatedModel<ServiceDto>>> getSearchService({
    required int items,
    required int page,
    required String name,
  });
  Future<AppResponse<PaginatedModel<PropertyDto>>> getPropertyOffice({
    required int items,
    required int page,
    required int id,
    required String type,
  });
  Future<AppResponse<PaginatedModel<ServiceDto>>> getAllService({
    required int items,
    required int page,
    int regionId,
    int cityId,
    String career,
  });
  Future<AppResponse> postServiceFeeback({
    required int id,
    double rate,
    String complaint,
  });
}

class ImpServicesRepositories extends GetxService
    implements ServicesRepositories {
  ApiService apiService = Get.find<ApiService>();
  CacheService cacheService = Get.find<CacheService>();
  ImpServicesRepositories();

  @override
  Future<AppResponse<PaginatedModel<ServiceDto>>> getTopRateService({
    required int perPage,
    required int page,
  }) async {
    AppResponse<PaginatedModel<ServiceDto>> appResponse = AppResponse(
      success: false,
    );

    try {
      dio.Response response = await apiService.request(
        url: EndPoints.getTopRateService,
        method: Method.get,
        requiredToken: true,
        withLogging: true,
        queryParameters: {"items": perPage, "page": page},
      );
      appResponse.success = true;
      appResponse.data = PaginatedModel<ServiceDto>.fromJson(
        response.data,
        ServiceDto.fromJson,
      );
    } catch (e) {
      appResponse.success = false;
      appResponse.networkFailure = ErrorHandler.handle(e).failure;
    }
    return appResponse;
  }

  @override
  Future<AppResponse<PaginatedModel<ServiceDto>>> getAllService({
    required int items,
    required int page,
    int regionId = 0,
    int cityId = 0,
    String career = "",
  }) async {
    AppResponse<PaginatedModel<ServiceDto>> appResponse = AppResponse(
      success: false,
    );

    try {
      Map<String, dynamic> queryParams = {"items": items, "page": page};

      if (regionId != 0) queryParams["regionId"] = regionId;
      if (cityId != 0) queryParams["cityId"] = cityId;
      if (career != "") queryParams["career"] = career;
      dio.Response response = await apiService.request(
        url: EndPoints.getServicefFilters,
        method: Method.get,
        requiredToken: true,
        withLogging: true,
        queryParameters: queryParams,
      );
      appResponse.success = true;
      appResponse.data = PaginatedModel<ServiceDto>.fromJson(
        response.data,
        ServiceDto.fromJson,
      );
    } catch (e) {
      appResponse.success = false;
      appResponse.networkFailure = ErrorHandler.handle(e).failure;
    }
    return appResponse;
  }

  @override
  Future<AppResponse<ServiceModel>> getService({required int id}) async {
    AppResponse<ServiceModel> appResponse = AppResponse(success: false);
    try {
      dio.Response response = await apiService.request(
        url: EndPoints.getService + id.toString(),
        method: Method.get,
        requiredToken: true,
        withLogging: true,
      );
      appResponse.success = true;
      appResponse.successMessage = response.data['message'];
      appResponse.data = ServiceModel.fromJson(response.data['data']);
    } catch (e) {
      appResponse.success = false;
      appResponse.networkFailure = ErrorHandler.handle(e).failure;
    }
    return appResponse;
  }

  @override
  Future<AppResponse<PaginatedModel<ServiceDto>>> getSearchService({
    required int items,
    required int page,
    required String name,
  }) async {
    AppResponse<PaginatedModel<ServiceDto>> appResponse = AppResponse(
      success: false,
    );

    try {
      dio.Response response = await apiService.request(
        url: EndPoints.getServiceSearch,
        method: Method.get,
        requiredToken: true,
        withLogging: true,
        queryParameters: {"items": items, "page": page, "name": name},
      );
      appResponse.success = true;
      appResponse.data = PaginatedModel<ServiceDto>.fromJson(
        response.data,
        ServiceDto.fromJson,
      );
    } catch (e) {
      appResponse.success = false;
      appResponse.networkFailure = ErrorHandler.handle(e).failure;
    }
    return appResponse;
  }

  @override
  Future<AppResponse> postServiceFeeback({
    required int id,
    double rate = 0,
    String complaint = "",
  }) async {
    AppResponse appResponse = AppResponse(success: false);
    try {
      Map<String, dynamic> queryParams = {};

      if (rate != 0) queryParams["rate"] = rate;
      if (complaint != "") queryParams["complaint"] = complaint;
      dio.Response response = await apiService.request(
        url: EndPoints.getService + id.toString() + EndPoints.feedback,
        method: Method.post,
        requiredToken: true,
        withLogging: true,
        params: queryParams,
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
  Future<AppResponse<PaginatedModel<PropertyDto>>> getPropertyOffice({
    required int items,
    required int page,
    required int id,
    required String type,
  }) async {
    AppResponse<PaginatedModel<PropertyDto>> appResponse = AppResponse(
      success: false,
    );

    try {
      dio.Response response = await apiService.request(
        url: EndPoints.getServiceSearch,
        method: Method.get,
        requiredToken: true,
        withLogging: true,
        queryParameters: {
          "items": items,
          "page": page,
          "officeId": id,
          "property_type": type,
        },
      );
      appResponse.success = true;
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
