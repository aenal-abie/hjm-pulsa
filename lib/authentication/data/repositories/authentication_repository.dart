import '../../../core/data/remotes/custom_exception.dart';
import '../../../core/domain/use_cases/either.dart';
import '../../domain/repositories/authentication_repository.dart';
import '../../domain/use_cases/get_token.dart';
import '../../domain/use_cases/login.dart';
import '../local/data_sources/base/authentication_cache.dart';
import '../remote/data_sources/base/authentication_remote.dart';

class AuthenticationRepository extends IAuthenticationRepository {
  final IAuthenticationRemote _authenticationRemote;
  final IAuthenticationCache _iAuthenticationCache;

  AuthenticationRepository(
      this._authenticationRemote, this._iAuthenticationCache);
  @override
  ELogin login(LoginParams loginParams) async {
    try {
      var result = await _authenticationRemote.login(loginParams);
      _iAuthenticationCache.saveUser(result);
      return Right(true);
    } on CustomException catch (e) {
      return Left(e.toFailure());
    }
  }

  @override
  EGetToken getToken() async {
    try {
      var token = await _iAuthenticationCache.getToken();
      return Right(token ?? "");
    } on CustomException catch (e) {
      return Left(e.toFailure());
    }
  }
}
