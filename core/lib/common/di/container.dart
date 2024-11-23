import 'package:core/common/data/data_sources/remote/base/file_remote.dart';
import 'package:core/common/data/data_sources/remote/base/firebase_config_service.dart';
import 'package:core/common/domain/repositories/firebase_config_repository.dart';
import 'package:core/common/domain/use_cases/download_file.dart';
import 'package:core/common/domain/use_cases/get_app_version.dart';
import 'package:get_it/get_it.dart';

import '../data/data_sources/remote/file_remote.dart';
import '../data/data_sources/remote/firebase_config_service.dart';
import '../data/repositories/file_repository.dart';
import '../data/repositories/firebase_config_repository.dart';
import '../domain/repositories/file_repository.dart';

Future<void> initCommon(GetIt di) async {
  ///use cases
  di.registerLazySingleton(() => DownloadFile(di()));
  di.registerLazySingleton(() => GetStoreAppVersion(di()));

  ///repositories
  di.registerLazySingleton<IFileRepository>(
      () => FileRepository(fileRemote: di(), networkInfo: di()));
  di.registerLazySingleton<IFirebaseConfigRepository>(
      () => FirebaseConfigRepository(di(), di()));

  ///remotes
  di.registerLazySingleton<IFileRemote>(() => FileRemote(di()));
  di.registerLazySingleton<IFirebaseConfigService>(
      () => FirebaseConfigService());
}
