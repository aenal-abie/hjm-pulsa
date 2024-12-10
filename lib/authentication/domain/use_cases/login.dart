import 'package:either_dart/either.dart';
import 'package:pulsa/core/domain/use_cases/usecase.dart';

import '../../../core/domain/error/failures.dart';
import '../repositories/authentication_repository.dart';

typedef ELogin = Future<Either<Failure, bool>>;

class Login extends UseCase<bool, LoginParams> {
  final IAuthenticationRepository repository;

  Login(this.repository);
  @override
  ELogin call(LoginParams params) async {
    return repository.login(params);
  }
}

class LoginParams {
  final String email;
  final String password;

  LoginParams({required this.email, required this.password});

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
    };
  }
}
