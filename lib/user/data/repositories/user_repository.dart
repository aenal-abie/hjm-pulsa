import '../../../authentication/data/local/data_sources/base/authentication_cache.dart';
import '../../../core/data/remotes/custom_exception.dart';
import '../../../core/domain/use_cases/either.dart';
import '../../domain/repositories/user_repository.dart';
import '../../domain/use_cases/changing_pin.dart';
import '../remote/data_sources/base/user_remote.dart';

class UserRepository extends IUserRepository {
  final IUserRemote _authenticationRemote;
  final IAuthenticationCache _iAuthenticationCache;

  UserRepository(this._authenticationRemote, this._iAuthenticationCache);

  @override
  EChangePin changePin(ChangingPinParam params) async {
    try {
      var token = await _iAuthenticationCache.getToken() ?? "";
      await _authenticationRemote.changePin(params, token);
      return Right(true);
    } on CustomException catch (e) {
      return Left(e.toFailure());
    }
  }
}
