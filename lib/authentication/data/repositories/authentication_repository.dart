import 'package:pulsa/authentication/domain/use_cases/login.dart';

import '../../../core/domain/use_cases/either.dart';
import '../../domain/repositories/authentication_repository.dart';
import '../remote/data_sources/base/authentication_remote.dart';

class AuthenticationRepository extends IAuthenticationRepository {
  final IAuthenticationRemote _authenticationRemote;

  AuthenticationRepository(this._authenticationRemote);
  @override
  ELogin login(LoginParams loginParams) async{
    var data = await _authenticationRemote.login(loginParams);
    return Right(data);

  }
}
