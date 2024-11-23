import 'package:core/domain/error/failures.dart';
import 'package:core/domain/usecases/usecase.dart';
import 'package:dartz/dartz.dart';

import '../repositories/firebase_config_repository.dart';

class GetStoreAppVersion extends UseCase<String, NoParams> {
  final IFirebaseConfigRepository firebaseConfigRepository;

  GetStoreAppVersion(this.firebaseConfigRepository);

  @override
  Future<Either<Failure, String>> call(NoParams params) async {
    return firebaseConfigRepository.getAppVersion();
  }
}
