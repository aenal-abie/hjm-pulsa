import 'package:hive/hive.dart';
import 'package:pulsa/authentication/data/remote/models/user_dto.dart';
import 'package:pulsa/authentication/domain/use_cases/login.dart';

import '../../../../core/data/remotes/custom_exception.dart';
import 'base/authentication_cache.dart';

class AuthenticationCache extends IAuthenticationCache {
  static const userHive = "user";
  static const userData = "user_data";
  @override
  void saveUser(UserDto data) async {
    try {
      var isOpen = !Hive.isBoxOpen(userHive);
      if (isOpen) {
        await Hive.openBox(userHive);
      }
      final box = Hive.box(userHive);
      box.put(userData, data.toJson());
    } catch (e) {
      throw CacheException();
    }
  }
}
