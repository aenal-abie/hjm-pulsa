import 'dart:async';

import 'package:core/data/data_sources/remotes/custom_exception.dart';
import 'package:core/data/network/network_info.dart';
import 'package:core/domain/error/failures.dart';
import 'package:dartz/dartz.dart';

import '../../domain/repositories/file_repository.dart';
import '../../domain/use_cases/download_file.dart';
import '../data_sources/remote/base/file_remote.dart';

class FileRepository extends IFileRepository {
  final NetworkInfo networkInfo;
  final IFileRemote fileRemote;

  FileRepository({
    required this.networkInfo,
    required this.fileRemote,
  });

  @override
  Stream<Either<Failure, double>> downloadFile(DownloadParam params) async* {
    if (await networkInfo.isConnected) {
      try {
        StreamController<Either<Failure, double>> downloadProgress =
            StreamController();
        var result = fileRemote.downloadFile(params);
        result.listen((event) {
          event.fold((error) => downloadProgress.add(Left(error.toFailure())),
              (progress) {
            if (progress < 1) {
              downloadProgress.add(Right(progress));
            } else {
              downloadProgress.add(Right(progress));
              downloadProgress.close();
            }
          });
        });
        yield* downloadProgress.stream;
      } on CustomException catch (e) {
        yield Left(e.toFailure());
      }
    }
    yield const Left(ServerFailure());
  }
}
