import 'package:core/domain/error/failures.dart';
import 'package:dartz/dartz.dart';

import '../../../data/data_sources/remotes/custom_exception.dart';
import '../../../data/network/network_info.dart';
import '../../domain/repositories/firebase_config_repository.dart';
import '../data_sources/remote/base/firebase_config_service.dart';

class FirebaseConfigRepository extends IFirebaseConfigRepository {
  final NetworkInfo networkInfo;
  final IFirebaseConfigService firebaseConfigService;

  FirebaseConfigRepository(this.networkInfo, this.firebaseConfigService);

  @override
  Future<Either<Failure, String>> getAppVersion() async {
    if (await networkInfo.isConnected) {
      try {
        var result = await firebaseConfigService.getAppVersion();
        return Right(result);
      } on CustomException catch (e) {
        return Left(e.toFailure());
      }
    } else {
      return const Left(ConnectionFailure());
    }
  }
}
