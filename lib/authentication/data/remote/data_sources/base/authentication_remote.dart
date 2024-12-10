import 'package:pulsa/authentication/domain/use_cases/login.dart';

abstract class IAuthenticationRemote {
  Future<bool> login(LoginParams params);
}
