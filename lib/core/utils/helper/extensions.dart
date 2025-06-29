import 'dart:io';

import 'package:dio/dio.dart';

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

//! add more extensions here:
