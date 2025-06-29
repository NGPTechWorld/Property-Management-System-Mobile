
import 'package:get_storage/get_storage.dart';
import 'cache_service.dart';

class GetStorageHelper extends CacheService {
  late final GetStorage _box;

  @override
  Future<void> init() async {
    await GetStorage.init();
    _box = GetStorage();
  }

  @override
  Future<bool> saveData({required String key, required dynamic value}) async {
    await _box.write(key, value);
    return true;
  }

  @override
  dynamic getData({required String key}) {
    return _box.read(key);
  }

  @override
  Future<bool> removeData({required String key}) async {
    await _box.remove(key);
    return true;
  }

  @override
  Future<bool> containsKey({required String key}) async {
    return _box.hasData(key);
  }

  @override
  Future<bool> clearData() async {
    await _box.erase();
    return true;
  }
}
