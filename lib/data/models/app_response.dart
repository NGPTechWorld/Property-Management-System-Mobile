import 'package:property_ms/core/services/errors/network_failure_model.dart';

class AppResponse<T> {
  bool success;
  T? data;
  String? _errorMessage;
  String? successMessage;
  NetworkFailureModel? networkFailure;

  set errorMessage(String value) {
    _errorMessage = value;
  }

  String getErrorMessage() {
    return _errorMessage ?? networkFailure?.message ?? "•Unknown error";
  }

  AppResponse({required this.success, this.data, this.networkFailure});
}
