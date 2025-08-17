import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';
import 'package:property_ms/core/services/api/api_service.dart';
import 'package:property_ms/core/services/api/end_points.dart';
import 'package:property_ms/core/services/cache/cache_service.dart';
import 'package:property_ms/core/services/errors/error_handler.dart';
import 'package:property_ms/data/dto/office_dto.dart';
import 'package:property_ms/data/dto/property_dto.dart';
import 'package:property_ms/data/models/app_response.dart';
import 'package:property_ms/data/models/office_model.dart';
import 'package:property_ms/data/models/paginated_model.dart';

abstract class OfficesRepositories {
  Future<AppResponse<OfficeModel>> getOffice({required int id});
  Future<AppResponse<PaginatedModel<OfficeDto>>> getTopRateOffice({
    required int perPage,
    required int page,
  });
  Future<AppResponse<PaginatedModel<OfficeDto>>> getOfficeList({
    required int perPage,
    required int page,
    int regionId,
    int cityId,
    int rate,
    String type,
  });
  Future<AppResponse<PaginatedModel<OfficeDto>>> getOfficeSearch({
    required int perPage,
    required int page,
    required String name,
  });
  Future<AppResponse<PaginatedModel<PropertyDto>>> getOfficeProperty({
    required int perPage,
    required int page,
    required int id,
    String type,
  });
  Future<AppResponse> postOfficeRate({required int id, required String rate});
  Future<AppResponse> postOfficeReport({
    required int id,
    required String complaint,
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

  @override
  Future<AppResponse<OfficeModel>> getOffice({required int id}) async {
    AppResponse<OfficeModel> appResponse = AppResponse(success: false);
    try {
      dio.Response response = await apiService.request(
        url: EndPoints.getOffice + id.toString(),
        method: Method.get,
        requiredToken: true,
        withLogging: true,
      );
      appResponse.success = true;
      appResponse.successMessage = response.data['message'];
      appResponse.data = OfficeModel.fromJson(response.data['data']);
    } catch (e) {
      appResponse.success = false;
      appResponse.networkFailure = ErrorHandler.handle(e).failure;
    }
    return appResponse;
  }

  @override
  Future<AppResponse<PaginatedModel<OfficeDto>>> getOfficeList({
    required int perPage,
    required int page,
    int regionId = 0,
    int cityId = 0,
    int rate = 0,
    String type = "الكل",
  }) async {
    AppResponse<PaginatedModel<OfficeDto>> appResponse = AppResponse(
      success: false,
    );

    try {
      Map<String, dynamic> queryParams = {"items": perPage, "page": page};

      if (regionId != 0) queryParams["region_id"] = regionId;
      if (cityId != 0) queryParams["city_id"] = cityId;
      if (rate != 0) queryParams["rate"] = rate;
      if (type != "الكل") queryParams["type"] = type;
      dio.Response response = await apiService.request(
        url: EndPoints.getOfficeList,
        method: Method.get,
        requiredToken: true,
        withLogging: true,
        queryParameters: queryParams,
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

  @override
  Future<AppResponse<PaginatedModel<OfficeDto>>> getOfficeSearch({
    required int perPage,
    required int page,
    required String name,
  }) async {
    AppResponse<PaginatedModel<OfficeDto>> appResponse = AppResponse(
      success: false,
    );

    try {
      dio.Response response = await apiService.request(
        url: EndPoints.getOfficeSearch,
        method: Method.get,
        requiredToken: true,
        withLogging: true,
        queryParameters: {"items": perPage, "page": page, "name": name},
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

  @override
  Future<AppResponse> postOfficeRate({
    required int id,
    required String rate,
  }) async {
    AppResponse appResponse = AppResponse(success: false);
    try {
      dio.Response response = await apiService.request(
        url: EndPoints.postOfficeRate,
        method: Method.post,
        requiredToken: true,
        withLogging: true,
        params: {"office_id": id, "rate": rate},
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
  Future<AppResponse> postOfficeReport({
    required int id,
    required String complaint,
  }) async {
    AppResponse appResponse = AppResponse(success: false);
    try {
      dio.Response response = await apiService.request(
        url: EndPoints.postOfficeReport,
        method: Method.post,
        requiredToken: true,
        withLogging: true,
        params: {"office_id": id, "complaint": complaint},
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
  Future<AppResponse<PaginatedModel<PropertyDto>>> getOfficeProperty({
    required int perPage,
    required int page,
    required int id,
    String type = "",
  }) async {
    AppResponse<PaginatedModel<PropertyDto>> appResponse = AppResponse(
      success: false,
    );

    try {
      Map<String, dynamic> queryParams = {
        "items": perPage,
        "page": page,
        "officeId": id,
      };

      if (type != "") queryParams["property_type"] = type;
      dio.Response response = await apiService.request(
        url: EndPoints.getOffice + id.toString() + EndPoints.getProperty,
        method: Method.get,
        requiredToken: true,
        withLogging: true,
        queryParameters: queryParams,
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
