import 'package:core/data/data_sources/remotes/custom_exception.dart';
import 'package:dartz/dartz.dart';

import '../../../../domain/use_cases/download_file.dart';

abstract class IFileRemote {
  Stream<Either<CustomException, double>> downloadFile(DownloadParam params);
}
