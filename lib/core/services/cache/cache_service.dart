//!===================================================================!//
//!                      don't edit this file                         !//
//!===================================================================!//

import 'package:get/get.dart';

abstract class CacheService extends GetxService {
  Future<void> init();
  Future<bool> saveData({required String key, required dynamic value});
  dynamic getData({required String key});
  Future<bool> removeData({required String key});
  Future<bool> containsKey({required String key});
  Future<bool> clearData();
}
