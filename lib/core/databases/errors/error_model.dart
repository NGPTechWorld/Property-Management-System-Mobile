import '../api/end_points.dart';

//!===================================================================!//
//!                      don't edit this file                         !//
//!===================================================================!//

class ErrorModel {
  final String errorMessage;

  ErrorModel({required this.errorMessage});
  factory ErrorModel.fromJson(Map jsonData) {
    return ErrorModel(
      errorMessage: jsonData[ApiKey.message],
    );
  }
}
