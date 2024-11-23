import 'package:core/data/data_sources/remotes/api_provider.dart';
import 'package:dartz/dartz.dart';

import '../../../../data/data_sources/remotes/custom_exception.dart';
import '../../../domain/use_cases/download_file.dart';
import 'base/file_remote.dart';

class FileRemote extends IFileRemote {
  final ApiProvider apiProvider;

  FileRemote(this.apiProvider);

  @override
  Stream<Either<CustomException, double>> downloadFile(
      DownloadParam params) async* {
    var result = apiProvider.downloadStream(params.url, params.fileName);
    yield* result;
  }
}
