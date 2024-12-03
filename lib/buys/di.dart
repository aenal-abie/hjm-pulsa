import 'package:core/di/container.dart';
import 'package:pulsa/buys/data/remote/data_sources/abstract/product_remote_data.dart';
import 'package:pulsa/buys/data/remote/data_sources/product_remote.dart';
import 'package:pulsa/buys/domain/repositories/product_repository.dart';
import 'package:pulsa/buys/domain/use_cases/get_prices.dart';

import 'data/repositories/product_repository.dart';

Future<void> inject() async {
  di.registerLazySingleton(() => GetPrices(di()));
  di.registerLazySingleton<IProductRepository>(() => PriceRepository(di()));
  di.registerLazySingleton<IProductRemoteData>(() => ProductRemoteData(di()));
}
