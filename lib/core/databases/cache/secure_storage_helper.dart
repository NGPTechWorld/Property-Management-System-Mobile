//!===================================================================!//
//!                      don't edit this file                         !//
//!===================================================================!//

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'storage_helper.dart';

class SecureStorageHelper extends StorageHelper {
  static const FlutterSecureStorage _secureStorage = FlutterSecureStorage();

  @override
  Future<void> init() async {}

  @override
  Future<bool> saveData({required String key, required dynamic value}) async {
    if (value is String) {
      await _secureStorage.write(key: key, value: value);
      return true;
    } else {
      throw ArgumentError('SecureStorage only supports String values.');
    }
  }

  @override
  Future<String?> getData({required String key}) async {
    return await _secureStorage.read(key: key);
  }

  @override
  Future<bool> removeData({required String key}) async {
    await _secureStorage.delete(key: key);
    return true;
  }

  @override
  Future<bool> containsKey({required String key}) async {
    final allKeys = await _secureStorage.readAll();
    return allKeys.containsKey(key);
  }

  @override
  Future<bool> clearData() async {
    await _secureStorage.deleteAll();
    return true;
  }
}
