import '../use_cases/login.dart';

abstract class IAuthenticationRepository {
  ELogin login(LoginParams loginParams);
}