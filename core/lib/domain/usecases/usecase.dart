import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../error/failures.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}

class InValidParams {
  final bool invalid;
  final String? message;

  InValidParams({required this.invalid, this.message});
}

class ArgumentError extends InvalidParam {
  const ArgumentError(String message) : super(message: message);
}
