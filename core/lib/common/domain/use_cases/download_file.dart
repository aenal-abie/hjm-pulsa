import 'package:core/domain/error/failures.dart';
import 'package:core/domain/usecases/stream_usecase.dart';
import 'package:dartz/dartz.dart';

import '../repositories/file_repository.dart';

class DownloadFile extends StreamUseCase<double, DownloadParam> {
  final IFileRepository fileRepository;

  DownloadFile(this.fileRepository);

  @override
  Stream<Either<Failure, double>> call(DownloadParam params) async* {
    yield* fileRepository.downloadFile(params);
  }
}

class DownloadParam {
  final String url;
  final String fileName;

  DownloadParam(this.url, this.fileName);
}
