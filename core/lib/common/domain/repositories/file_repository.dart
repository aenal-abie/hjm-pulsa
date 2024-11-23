import 'package:core/domain/error/failures.dart';
import 'package:dartz/dartz.dart';

import '../use_cases/download_file.dart';

abstract class IFileRepository {
  Stream<Either<Failure, double>> downloadFile(DownloadParam params);
}
