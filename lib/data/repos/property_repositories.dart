import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';
import 'package:property_ms/core/services/api/api_service.dart';
import 'package:property_ms/core/services/api/end_points.dart';
import 'package:property_ms/core/services/cache/cache_service.dart';
import 'package:property_ms/core/services/errors/error_handler.dart';
import 'package:property_ms/data/dto/property_dto.dart';
import 'package:property_ms/data/dto/property_search_filter_dto.dart';
import 'package:property_ms/data/models/app_response.dart';
import 'package:property_ms/data/models/paginated_model.dart';
import 'package:property_ms/data/models/property_model.dart';

abstract class PropertyRepositories {
  Future<AppResponse<PropertyModel>> getProperty({required int id});
  Future<AppResponse<PaginatedModel<PropertyDto>>> getPropertyRelated({
    required int id,
  });
  Future<AppResponse<List<PropertyModel>>> getPropertyCompare({
    required int id1,
    required int id2,
  });
  Future<AppResponse<PaginatedModel<PropertyDto>>> getTopRateProperty({
    required int items,
    required int page,
    required String type,
  });
  Future<AppResponse<PaginatedModel<PropertyDto>>> getPropertySerach({
    required int items,
    required int page,
    required String title,
  });
  Future<AppResponse<PaginatedModel<PropertyDto>>> getPropertyFilters({
    required int items,
    required int page,
    required int regionId,
    required int cityId,
    required String tag,
    required String listingType,
    required String orderByArea,
    required String orderByPrice,
    required String orderByDate,
  });
  Future<AppResponse<PaginatedModel<PropertyDto>>> getPropertyFiltersPro({
    required int items,
    required int page,
    required PropertySearchFilterDto model,
  });
  Future<AppResponse<PaginatedModel<PropertyDto>>> getPropertyPromoted({
    required int items,
    required int page,
  });
  Future<AppResponse> postPropertyRate({required int id, required double rate});
}

class ImpPropertyRepositories extends GetxService
    implements PropertyRepositories {
  ApiService apiService = Get.find<ApiService>();
  CacheService cacheService = Get.find<CacheService>();
  ImpPropertyRepositories();

  @override
  Future<AppResponse<PaginatedModel<PropertyDto>>> getTopRateProperty({
    required int items,
    required int page,
    required String type,
  }) async {
    AppResponse<PaginatedModel<PropertyDto>> appResponse = AppResponse(
      success: false,
    );

    try {
      dio.Response response = await apiService.request(
        url: EndPoints.getTopRateProperty,
        method: Method.get,
        requiredToken: true,
        withLogging: true,
        queryParameters: {"items": items, "page": page, "type": type},
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

  @override
  Future<AppResponse<PaginatedModel<PropertyDto>>> getPropertyPromoted({
    required int items,
    required int page,
  }) async {
    AppResponse<PaginatedModel<PropertyDto>> appResponse = AppResponse(
      success: false,
    );

    try {
      dio.Response response = await apiService.request(
        url: EndPoints.getPropertyPromoted,
        method: Method.get,
        requiredToken: true,
        withLogging: true,
        queryParameters: {"items": items, "page": page},
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

  @override
  Future<AppResponse<PropertyModel>> getProperty({required int id}) async {
    AppResponse<PropertyModel> appResponse = AppResponse(success: false);
    try {
      dio.Response response = await apiService.request(
        url: EndPoints.getProperty + id.toString(),
        method: Method.get,
        requiredToken: true,
        withLogging: true,
      );
      appResponse.success = true;
      appResponse.successMessage = response.data['message'];
      appResponse.data = PropertyModel.fromJson(response.data['data']);
    } catch (e) {
      appResponse.success = false;
      appResponse.networkFailure = ErrorHandler.handle(e).failure;
    }
    return appResponse;
  }

  @override
  Future<AppResponse<List<PropertyModel>>> getPropertyCompare({
    required int id1,
    required int id2,
  }) async {
    AppResponse<List<PropertyModel>> appResponse = AppResponse(success: false);
    try {
      dio.Response response = await apiService.request(
        url: EndPoints.getPropertyCompare,
        method: Method.get,
        requiredToken: true,
        withLogging: true,
        queryParameters: {"id1": id1, "id2": id2},
      );
      appResponse.success = true;
      appResponse.successMessage = response.data['message'];
      appResponse.data = [
        PropertyModel.fromJson(response.data['data']['property_1']),
        PropertyModel.fromJson(response.data['data']['property_2']),
      ];
    } catch (e) {
      appResponse.success = false;
      appResponse.networkFailure = ErrorHandler.handle(e).failure;
    }
    return appResponse;
  }

  @override
  Future<AppResponse<PaginatedModel<PropertyDto>>> getPropertyFilters({
    required int items,
    required int page,
    required int regionId,
    required int cityId,
    required String tag,
    required String listingType,
    required String orderByArea,
    required String orderByPrice,
    required String orderByDate,
  }) async {
    AppResponse<PaginatedModel<PropertyDto>> appResponse = AppResponse(
      success: false,
    );
    try {
      Map<String, dynamic> queryParams = {"items": items, "page": page};

      if (regionId != 0) queryParams["regionId"] = regionId;
      if (cityId != 0) queryParams["cityId"] = cityId;
      if (tag.isNotEmpty) queryParams["tag"] = tag;
      if (listingType.isNotEmpty) queryParams["listing_type"] = listingType;
      if (orderByArea.isNotEmpty) queryParams["orderByArea"] = orderByArea;
      if (orderByPrice.isNotEmpty) queryParams["orderByPrice"] = orderByPrice;
      if (orderByDate.isNotEmpty) queryParams["orderByDate"] = orderByDate;

      dio.Response response = await apiService.request(
        url: EndPoints.getFiltersProperty,
        method: Method.get,
        requiredToken: true,
        withLogging: true,
        queryParameters: queryParams,
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

  @override
  Future<AppResponse<PaginatedModel<PropertyDto>>> getPropertyFiltersPro({
    required int items,
    required int page,
    required PropertySearchFilterDto model,
  }) async {
    AppResponse<PaginatedModel<PropertyDto>> appResponse = AppResponse(
      success: false,
    );
    try {
      final data = model.toJson();
      dio.Response response = await apiService.request(
        url: EndPoints.getSearchFilterProperty,
        method: Method.post,
        requiredToken: true,
        withLogging: true,
        queryParameters: {"items": items, "page": page},
        params: data,
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

  @override
  Future<AppResponse> postPropertyRate({
    required int id,
    required double rate,
  }) async {
    AppResponse appResponse = AppResponse(success: false);
    try {
      dio.Response response = await apiService.request(
        url: EndPoints.getProperty + id.toString() + EndPoints.rate,
        method: Method.post,
        requiredToken: true,
        withLogging: true,
        params: {"rate": rate},
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
  Future<AppResponse<PaginatedModel<PropertyDto>>> getPropertySerach({
    required int items,
    required int page,
    required String title,
  }) async {
    AppResponse<PaginatedModel<PropertyDto>> appResponse = AppResponse(
      success: false,
    );
    try {
      dio.Response response = await apiService.request(
        url: EndPoints.getSearchProperty,
        method: Method.get,
        requiredToken: true,
        withLogging: true,
        queryParameters: {"items": items, "page": page, "title": title},
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

  @override
  Future<AppResponse<PaginatedModel<PropertyDto>>> getPropertyRelated({
    required int id,
  }) async {
    AppResponse<PaginatedModel<PropertyDto>> appResponse = AppResponse(
      success: false,
    );
    try {
      dio.Response response = await apiService.request(
        url: EndPoints.getProperty + id.toString() + EndPoints.related,
        method: Method.get,
        requiredToken: true,
        withLogging: true,
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
