import 'package:either_dart/either.dart';
import 'package:equatable/equatable.dart';

import '../error/failures.dart';

abstract class StreamUseCase<Type, Params> {
  Stream<Either<Failure, Type>> call(Params params);
}

class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}
