//!===================================================================!//
//!                      don't edit this file                         !//
//!===================================================================!//

import 'package:shared_preferences/shared_preferences.dart';

import 'cache_service.dart';

class SharedPrefsHelper extends CacheService {
  static late SharedPreferences _sharedPreferences;

//! Here The Initialize of cache .
  @override
  init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

//! this method to put data in local database using key

  String? getDataString({
    required String key,
  }) {
    return _sharedPreferences.getString(key);
  }

//! this method to put data in local database using key

  @override
  Future<bool> saveData({required String key, required dynamic value}) async {
    if (value is bool) {
      return await _sharedPreferences.setBool(key, value);
    }
    if (value is String) {
      return await _sharedPreferences.setString(key, value);
    }

    if (value is int) {
      return await _sharedPreferences.setInt(key, value);
    } else {
      return await _sharedPreferences.setDouble(key, value);
    }
  }

//! this method to get data already saved in local database

  @override
  dynamic getData({required String key}) {
    return _sharedPreferences.get(key);
  }

//! remove data using specific key

  @override
  Future<bool> removeData({required String key}) async {
    return await _sharedPreferences.remove(key);
  }

//! this method to check if local database contains {key}
  @override
  Future<bool> containsKey({required String key}) async {
    return _sharedPreferences.containsKey(key);
  }

//! clear all data in the local database
  @override
  Future<bool> clearData() async {
    return await _sharedPreferences.clear();
  }

//! this method to put data in local database using key
  Future<dynamic> put({
    required String key,
    required dynamic value,
  }) async {
    if (value is String) {
      return await _sharedPreferences.setString(key, value);
    } else if (value is bool) {
      return await _sharedPreferences.setBool(key, value);
    } else {
      return await _sharedPreferences.setInt(key, value);
    }
  }
}
