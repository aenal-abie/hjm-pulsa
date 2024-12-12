import 'package:pulsa/authentication/data/remote/models/user_dto.dart';


abstract class  IAuthenticationCache {
  void saveUser(UserDto data);

  Future<String?> getToken();
}
