import 'package:either_dart/either.dart';
import 'package:pulsa/core/domain/use_cases/usecase.dart';

import '../../../core/domain/error/failures.dart';
import '../repositories/user_repository.dart';

typedef EChangePin = Future<Either<Failure, bool>>;

class ChangingPin extends UseCase<bool, ChangingPinParam> {
  final IUserRepository repository;

  ChangingPin(this.repository);

  @override
  EChangePin call(ChangingPinParam params) async {
    return repository.changePin(params);
  }
}

class ChangingPinParam {
  final String newPin;
  final String oldPin;

  ChangingPinParam({required this.newPin, required this.oldPin});

  Map<String, dynamic> toJson() {
    return {
      'new_pin': newPin,
      'old_pin': oldPin,
    };
  }
}
