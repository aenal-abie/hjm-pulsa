import 'package:pulsa/authentication/data/local/data_sources/authentication_cache.dart';
import 'package:pulsa/authentication/data/local/data_sources/base/authentication_cache.dart';
import 'package:pulsa/authentication/data/remote/data_sources/base/authentication_remote.dart';
import 'package:pulsa/authentication/domain/repositories/authentication_repository.dart';
import 'package:pulsa/authentication/domain/use_cases/logout.dart';

import '../core/di/container.dart';
import 'data/remote/data_sources/authentication_remote.dart';
import 'data/repositories/authentication_repository.dart';
import 'domain/use_cases/get_token.dart';
import 'domain/use_cases/login.dart';

Future<void> injectAuthentication() async {
  di.registerLazySingleton(() => GetToken(di()));
  di.registerLazySingleton(() => Login(di()));
  di.registerLazySingleton(() => Logout(di()));
  di.registerLazySingleton<IAuthenticationRepository>(
      () => AuthenticationRepository(di(), di()));
  di.registerLazySingleton<IAuthenticationRemote>(() => AuthenticationRemote(di()));
  di.registerLazySingleton<IAuthenticationCache>(() => AuthenticationCache());
}
