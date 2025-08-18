import 'dart:io';

import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';

extension StringExtension on String? {
  bool isNullOrEmpty() => this == null || this == "";
}

extension ListExtension<T> on List<T>? {
  bool isNullOrEmpty() => this == null || this!.isEmpty;
}

// Extension to capitalize strings
extension StringCapitalize on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1)}";
  }
}

extension FileMultipartExtension on File? {
  Future<MultipartFile?> toMultipartFile() async {
    if (this == null) return null;
    return await MultipartFile.fromFile(
      this!.path,
      filename: this!.path.split('/').last,
    );
  }
}

extension FileMultipartExtension1 on File? {
  Future<MultipartFile?> toMultipartFile1() async {
    if (this == null) return null;

    final fileName = this!.path.split('/').last;
    final ext = fileName.split('.').last.toLowerCase();

    // حدد نوع الصورة حسب الامتداد
    final contentType =
        ext == 'png'
            ? MediaType('image', 'png')
            : MediaType('image', 'jpeg'); // افتراضياً jpeg

    return await MultipartFile.fromFile(
      this!.path,
      filename: fileName,
      contentType: contentType,
    );
  }
}

//! add more extensions here:
