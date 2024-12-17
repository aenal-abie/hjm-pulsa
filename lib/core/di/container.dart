import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

import '../data/remotes/api_provider.dart';

final di = GetIt.instance;

Future<void> injectCore() async {
  //remotes
  di.registerLazySingleton<ApiProvider>(() => ApiProvider(di()));
  di.registerSingleton<Dio>(initDio);
  final dir = await getApplicationDocumentsDirectory();
  Hive.init(dir.path);

}
