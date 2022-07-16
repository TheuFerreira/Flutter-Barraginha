import 'package:flutter_barraginha/domain/repositories/local_cache_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalCacheRepositoryImpl implements LocalCacheRepository {
  @override
  Future<bool?> getBool(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(key);
  }

  @override
  Future<void> setBool(String key, bool value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool(key, value);
  }
}
