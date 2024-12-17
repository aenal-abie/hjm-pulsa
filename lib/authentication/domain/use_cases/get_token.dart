import 'package:either_dart/either.dart';
import 'package:pulsa/core/domain/use_cases/usecase.dart';

import '../../../core/domain/error/failures.dart';
import '../repositories/authentication_repository.dart';

typedef EGetToken = Future<Either<Failure, String>>;

class GetToken extends UseCase<String, NoParams> {
  final IAuthenticationRepository repository;

  GetToken(this.repository);

  @override
  EGetToken call(NoParams params) async {
    return repository.getToken();
  }
}
