import 'package:hive/hive.dart';
import 'package:pulsa/authentication/data/remote/models/user_dto.dart';

import '../../../../core/data/remotes/custom_exception.dart';
import 'base/authentication_cache.dart';

class AuthenticationCache extends IAuthenticationCache {
  static const userHive = "user";
  static const userData = "user_data";
  @override
  void saveUser(UserDto data) async {
    try {
      var isOpen = Hive.isBoxOpen(userHive);
      if (!isOpen) {
        await Hive.openBox(userHive);
      }
      final box = Hive.box(userHive);
      box.put(userData, data.toJson());
    } catch (e) {
      throw CacheException();
    }
  }

  @override
  Future<String?> getToken() async {
    try {
      var isOpen = Hive.isBoxOpen(userHive);
      if (!isOpen) {
        await Hive.openBox(userHive);
      }
      final box = Hive.box(userHive);
      var data = box.get(userData, defaultValue: null);
      return UserDto.fromJson(data).token;
    } catch (e) {
      throw CacheException();
    }
  }

  @override
  Future<void> deleteUser() async {
    try {
      if (Hive.isBoxOpen(userHive)) {
        final box = Hive.box(userHive);
        await box.delete(userData);
      }
    } catch (e) {
      throw CacheException();
    }
  }
}
