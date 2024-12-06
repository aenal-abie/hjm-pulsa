import 'package:core/di/container.dart';
import 'package:pulsa/buys/data/remote/data_sources/abstract/product_remote_data.dart';
import 'package:pulsa/buys/data/remote/data_sources/product_remote.dart';
import 'package:pulsa/buys/domain/repositories/product_repository.dart';
import 'package:pulsa/buys/domain/use_cases/buy_product.dart';
import 'package:pulsa/buys/domain/use_cases/get_products.dart';
import 'package:pulsa/buys/presentation/manager/buy_controller.dart';

import 'data/repositories/product_repository.dart';

Future<void> injectBuys() async {
  initCoreDI();
  di.registerLazySingleton(() => BuyProduct(di()));
  di.registerLazySingleton(() => GetProducts(di()));
  di.registerLazySingleton<IProductRepository>(() => PriceRepository(di()));
  di.registerLazySingleton<IProductRemoteData>(() => ProductRemoteData(di()));
}
