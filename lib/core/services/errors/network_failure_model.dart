
class NetworkFailureModel {
  int code;
  String message;
  dynamic data;
  NetworkFailureModel({required this.code, required this.message, this.data});

  @override
  String toString() => 'NetworkFailureModel(code: $code, message: $message)';
}
