import 'package:dio/dio.dart' as dio;
import 'package:get/get_core/get_core.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:property_ms/core/services/api/api_service.dart';
import 'package:property_ms/core/services/api/end_points.dart';
import 'package:property_ms/core/services/cache/cache_service.dart';
import 'package:property_ms/core/services/errors/error_handler.dart';
import 'package:property_ms/data/dto/tourism_dto.dart';
import 'package:property_ms/data/models/app_response.dart';
import 'package:property_ms/data/models/availability_tourisem.dart';
import 'package:property_ms/data/models/paginated_model.dart';
import 'package:property_ms/data/models/tourism_model.dart';

abstract class TourismRepositories {
  Future<AppResponse<TourismModel>> getTourism({required int id});
  Future<AppResponse<AvailabilityModel>> getTourismAvailability({
    required int id,
  });
  Future<AppResponse<PaginatedModel<TourismDto>>> getTourismFilters({
    required int page,
    required int items,
    required int regionId,
    required int cityId,
    required String tag,
    required String orderByArea,
    required String orderByPrice,
    required String orderByDate,
  });
  Future<AppResponse<PaginatedModel<TourismDto>>> getTourismSearch({
    required String title,
    required int page,
    required int items,
  });
  Future<AppResponse<PaginatedModel<TourismDto>>> getTourismRelated({
    required int id,
  });
  Future<AppResponse> postBookTourism({
    required int propertyId,
    required String startDate,
    required String endDate,
    required String paymentId,
    required double deposit,
    required double totalPrice,
  });
}

class ImpTourismRepositories extends GetxService
    implements TourismRepositories {
  ApiService apiService = Get.find<ApiService>();
  CacheService cacheService = Get.find<CacheService>();
  ImpTourismRepositories();

  @override
  Future<AppResponse<TourismModel>> getTourism({required int id}) async {
    AppResponse<TourismModel> appResponse = AppResponse(success: false);
    try {
      dio.Response response = await apiService.request(
        url: EndPoints.getTourism + id.toString(),
        method: Method.get,
        requiredToken: true,
        withLogging: true,
      );
      appResponse.success = true;
      appResponse.successMessage = response.data['message'];
      appResponse.data = TourismModel.fromJson(response.data['data']);
    } catch (e) {
      appResponse.success = false;
      appResponse.networkFailure = ErrorHandler.handle(e).failure;
    }
    return appResponse;
  }

  @override
  Future<AppResponse<PaginatedModel<TourismDto>>> getTourismFilters({
    required int page,
    required int items,
    required int regionId,
    required int cityId,
    required String tag,
    required String orderByArea,
    required String orderByPrice,
    required String orderByDate,
  }) async {
    AppResponse<PaginatedModel<TourismDto>> appResponse = AppResponse(
      success: false,
    );
    try {
      Map<String, dynamic> queryParams = {"items": items, "page": page};
      if (regionId != 0) queryParams["regionId"] = regionId;
      if (cityId != 0) queryParams["cityId"] = cityId;
      if (tag.isNotEmpty) queryParams["tag"] = tag;
      if (orderByArea.isNotEmpty) queryParams["orderByArea"] = orderByArea;
      if (orderByPrice.isNotEmpty) queryParams["orderByPrice"] = orderByPrice;
      if (orderByDate.isNotEmpty) queryParams["orderByDate"] = orderByDate;

      dio.Response response = await apiService.request(
        url: EndPoints.getFiltersTourism,
        method: Method.get,
        requiredToken: true,
        withLogging: true,
        queryParameters: queryParams,
      );
      appResponse.success = true;
      appResponse.successMessage = response.data['message'];
      appResponse.data = PaginatedModel<TourismDto>.fromJson(
        response.data,
        TourismDto.fromJson,
      );
    } catch (e) {
      appResponse.success = false;
      appResponse.networkFailure = ErrorHandler.handle(e).failure;
    }
    return appResponse;
  }

  @override
  Future<AppResponse<PaginatedModel<TourismDto>>> getTourismSearch({
    required String title,
    required int page,
    required int items,
  }) async {
    AppResponse<PaginatedModel<TourismDto>> appResponse = AppResponse(
      success: false,
    );
    try {
      dio.Response response = await apiService.request(
        url: EndPoints.getSearchTourism,
        method: Method.get,
        requiredToken: true,
        withLogging: true,
        queryParameters: {"items": items, "page": page, "title": title},
      );
      appResponse.success = true;
      appResponse.successMessage = response.data['message'];
      appResponse.data = PaginatedModel<TourismDto>.fromJson(
        response.data,
        TourismDto.fromJson,
      );
    } catch (e) {
      appResponse.success = false;
      appResponse.networkFailure = ErrorHandler.handle(e).failure;
    }
    return appResponse;
  }

  @override
  Future<AppResponse<PaginatedModel<TourismDto>>> getTourismRelated({
    required int id,
  }) async {
    AppResponse<PaginatedModel<TourismDto>> appResponse = AppResponse(
      success: false,
    );
    try {
      dio.Response response = await apiService.request(
        url: EndPoints.getTourismOnly + id.toString() + EndPoints.related,
        method: Method.get,
        requiredToken: true,
        withLogging: true,
      );
      appResponse.success = true;
      appResponse.successMessage = response.data['message'];
      appResponse.data = PaginatedModel<TourismDto>.fromJson(
        response.data,
        TourismDto.fromJson,
      );
    } catch (e) {
      appResponse.success = false;
      appResponse.networkFailure = ErrorHandler.handle(e).failure;
    }
    return appResponse;
  }

  @override
  Future<AppResponse<AvailabilityModel>> getTourismAvailability({
    required int id,
  }) async {
    AppResponse<AvailabilityModel> appResponse = AppResponse(success: false);
    try {
      dio.Response response = await apiService.request(
        url: EndPoints.getTourismOnly + id.toString() + EndPoints.availability,
        method: Method.get,
        requiredToken: true,
        withLogging: true,
      );
      appResponse.success = true;
      appResponse.successMessage = response.data['message'];
      appResponse.data = AvailabilityModel.fromJson(response.data['data']);
    } catch (e) {
      appResponse.success = false;
      appResponse.networkFailure = ErrorHandler.handle(e).failure;
    }
    return appResponse;
  }

  @override
  Future<AppResponse> postBookTourism({
    required int propertyId,
    required String startDate,
    required String endDate,
    required String paymentId,
    required double deposit,
    required double totalPrice,
  }) async {
    AppResponse appResponse = AppResponse(success: false);
    try {
      dio.Response response = await apiService.request(
        url: EndPoints.getTourismBook,
        method: Method.post,
        params: {
          "propertyId": propertyId,
          "startDate": startDate,
          "endDate": endDate,
          "payment_id": paymentId,
          "deposit": deposit,
          "totalPrice": totalPrice,
        },
        requiredToken: true,
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
