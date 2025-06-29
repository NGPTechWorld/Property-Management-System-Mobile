import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart' as getx;
import 'package:property_ms/core/services/cache/cache_keys.dart';
import 'package:property_ms/core/services/cache/cache_service.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

const kBaseUrl = "http://BASEURL/api/";
const kImagesUrl = "";

enum Method { get, post, put, delete, patch }

class TokenExpiredException implements Exception {
  String message;

  TokenExpiredException(this.message);
}

class ApiService extends getx.GetxService {
  late Dio _dio;
  CacheService cacheService = getx.Get.find<CacheService>();

  static header() => {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };

  ApiService() {
    init();
  }

  Future<ApiService> init() async {
    _dio = Dio(baseOptions);

    if (!kReleaseMode) {
      _dio.interceptors.add(logger);
    }

    //Add authInterceptor for handling 401 error code (unauthorized)
    // _dio.interceptors.add(authInterceptor());

    return this;
  }

  BaseOptions get baseOptions {
    return BaseOptions(
      baseUrl: kBaseUrl,
      connectTimeout: const Duration(milliseconds: 30 * 1000),
      receiveTimeout: const Duration(milliseconds: 30 * 1000),
      headers: header(),
    );
  }

  PrettyDioLogger get logger {
    return PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseHeader: true,
      enabled: kDebugMode,
      filter: (options, _) {
        return options.extra['logging'] == true;
      },
    );
  }

  /*
  InterceptorsWrapper authInterceptor() {
    return InterceptorsWrapper(onError: (err, handler) async {
      debugPrint('ERROR[${err.response?.statusCode}] => ${err.response?.data}');
      //TODO: checking if there is a need to lock the _dio and Interceptor objects
      if (err.response?.statusCode == 401) {
        //TODO: if this need, don't forget to unlock them
        AppResponse appResponse =
            await (getx.Get.find<UsersRepo>().updateToken());
        if (!appResponse.success) {
          //showErrorDialog(appResponse.errorMessage!);
          return handler.next(err);
        }
        String newAccessToken = appResponse.data!;
        // Update the request header with the new access token
        err.requestOptions.headers['Authorization'] = 'Bearer $newAccessToken';
        // Repeat the request with the updated header
        return handler.resolve(await _dio.fetch(err.requestOptions));
      }

      return handler.next(err);
    });
  }*/

  Future<dynamic> request({
    required String url,
    required Method method,
    required bool requiredToken,
    bool withLogging = true,
    Map<String, dynamic>? queryParameters,
    bool uploadImage = false,
    Map<String, dynamic>? additionalHeaders,
    Object? params,
  }) async {
    Response response;

    Map<String, dynamic> headers = header();

    if (requiredToken) {
      String? token = await cacheService.getData(key: kUserToken);

      headers = {
        'Content-Type': 'application/json',
        "Authorization": "Bearer $token",
      };
    }

    if (uploadImage) {
      //headers['accept'] = 'text/plain';
      headers['accept'] = 'application/json';
      headers['Content-Type'] = 'multipart/form-data';
    }

    Map<String, dynamic> allHeaders = {};
    allHeaders.addAll(headers);
    // Language header
    allHeaders.addAll({
      'Accept-Language': cacheService.getData(key: kLanguageCode),
    });
    // allHeaders.addAll({'Accept-Language': "en"});

    if (additionalHeaders != null) {
      allHeaders.addAll(additionalHeaders);
    }

    Options options = Options(
      headers: allHeaders,
      extra: {"logging": withLogging},
    );

    if (method == Method.post) {
      response = await _dio.post(
        url,
        data: params,
        options: options,
        queryParameters: queryParameters,
      );
    } else if (method == Method.delete) {
      response = await _dio.delete(
        url,
        queryParameters: queryParameters,
        options: options,
      );
    } else if (method == Method.patch) {
      response = await _dio.patch(
        url,
        data: params,
        options: options,
        queryParameters: queryParameters,
      );
    } else if (method == Method.put) {
      response = await _dio.put(
        url,
        data: params,
        options: options,
        queryParameters: queryParameters,
      );
    } else {
      response = await _dio.get(
        url,
        queryParameters: queryParameters,
        options: options,
      );
    }
    return response;
  }
}
