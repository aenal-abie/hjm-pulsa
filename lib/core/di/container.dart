import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../data/remotes/api_provider.dart';

final di = GetIt.instance;

void injectCore() {
  //remotes
  di.registerLazySingleton<ApiProvider>(() => ApiProvider(di()));
  di.registerSingleton<Dio>(initDio);
}
