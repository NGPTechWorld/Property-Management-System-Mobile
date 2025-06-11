import 'package:dio/dio.dart';
import '../errors/exception.dart';
import 'api_consumer.dart';
import 'end_points.dart';

//!===================================================================!//
//!                      don't edit this file                         !//
//!===================================================================!//

class DioConsumer extends ApiConsumer {
  final Dio dio;

  DioConsumer({required this.dio}) {
    dio.options.baseUrl = EndPoints.baseUrl;
    dio.interceptors.add(LogInterceptor(
      request: true,
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: true,
      error: true,
    ));
  }

  addInterceptors(Interceptor interceptor) {
    dio.interceptors.add(interceptor);
  }

//!POST
  @override
  Future post(
    String path, {
    dynamic data,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? extra,
    bool isFormData = false,
  }) async {
    try {
      var res = await dio.post(
        options: Options(
          headers: headers,
          extra: extra,
        ),
        path,
        data: isFormData ? FormData.fromMap(data) : data,
        queryParameters: queryParameters,
      );
      return res.data;
    } on DioException catch (e) {
      handleDioException(e);
    }
  }

//!GET
  @override
  Future get(
    String path, {
    Object? data,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? extra,
    ResponseType? responseType,
  }) async {
    try {
      var res = await dio.get(
        options: Options(
          headers: headers,
          extra: extra,
          responseType: responseType,
        ),
        path,
        data: data,
        queryParameters: queryParameters,
      );
      return res.data;
    } on DioException catch (e) {
      handleDioException(e);
    }
  }

//!DELETE
  @override
  Future delete(
    String path, {
    Object? data,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? extra,
  }) async {
    try {
      var res = await dio.delete(
        options: Options(
          headers: headers,
          extra: extra,
        ),
        path,
        data: data,
        queryParameters: queryParameters,
      );
      return res.data;
    } on DioException catch (e) {
      handleDioException(e);
    }
  }

//!PATCH
  @override
  Future patch(
    String path, {
    dynamic data,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
    bool isFormData = false,
    Map<String, dynamic>? extra,
  }) async {
    try {
      var res = await dio.patch(
        options: Options(
          headers: headers,
          extra: extra,
        ),
        path,
        data: isFormData ? FormData.fromMap(data) : data,
        queryParameters: queryParameters,
      );
      return res.data;
    } on DioException catch (e) {
      handleDioException(e);
    }
  }

  @override
  Future put(String path, {data, Map<String, dynamic>? queryParameters, Map<String, dynamic>? headers, bool isFormData = false, Map<String, dynamic>? extra}) async {
    try {
      var res = await dio.put(
        options: Options(
          headers: headers,
          extra: extra,
        ),
        path,
        data: isFormData ? FormData.fromMap(data) : data,
        queryParameters: queryParameters,
      );
      return res.data;
    } on DioException catch (e) {
      handleDioException(e);
    }
  }
}
