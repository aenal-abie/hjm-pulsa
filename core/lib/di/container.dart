
import 'package:data_connection_checker_nulls/data_connection_checker_nulls.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:sqflite/sqflite.dart';

import '../common/di/container.dart';
import '../data/data_sources/cache/core_database.dart';
import '../data/data_sources/remotes/api_provider.dart';
import '../data/network/network_info.dart';

final di = GetIt.instance;

Future<void> initCoreDI() async {

  initCommon(di);
  di.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(di()));
  di.registerLazySingleton(() => DataConnectionChecker());

  ///caches
  di.registerLazySingleton<Future<Database>>(
      () => DatabaseProvider.db.database);
  //remotes
  di.registerLazySingleton<ApiProvider>(() => ApiProvider(di()));
  di.registerSingleton<Dio>(initDio);
}
