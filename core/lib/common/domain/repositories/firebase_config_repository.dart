import 'package:core/domain/error/failures.dart';
import 'package:dartz/dartz.dart';

abstract class IFirebaseConfigRepository {
  Future<Either<Failure, String>> getAppVersion();
}
