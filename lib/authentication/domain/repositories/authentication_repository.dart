import 'package:pulsa/authentication/domain/use_cases/get_token.dart';

import '../use_cases/login.dart';

abstract class IAuthenticationRepository {
  ELogin login(LoginParams loginParams);

  EGetToken getToken();
}