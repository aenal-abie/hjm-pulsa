import 'package:either_dart/either.dart';
import 'package:pulsa/core/domain/use_cases/usecase.dart';

import '../../../core/domain/error/failures.dart';
import '../repositories/authentication_repository.dart';

typedef ELogout = Future<Either<Failure, bool>>;

class Logout extends UseCase<bool, NoParams> {
  final IAuthenticationRepository repository;

  Logout(this.repository);

  @override
  ELogout call(NoParams params) async {
    return repository.logout();
  }
}
