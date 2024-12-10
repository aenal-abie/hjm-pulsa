import 'package:pulsa/authentication/data/remote/models/user_dto.dart';
import 'package:pulsa/authentication/domain/use_cases/login.dart';


abstract class  IAuthenticationCache {
  void saveUser(UserDto data);
}
