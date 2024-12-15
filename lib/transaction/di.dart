import '../core/di/container.dart';
import 'data/remote/data_sources/abstract/product_remote_data.dart';
import 'data/remote/data_sources/product_remote.dart';
import 'data/repositories/product_repository.dart';
import 'domain/repositories/product_repository.dart';
import 'domain/use_cases/buy_product.dart';
import 'domain/use_cases/get_products.dart';

Future<void> injectBuys() async {
  di.registerLazySingleton(() => BuyProduct(di()));
  di.registerLazySingleton(() => GetProducts(di()));
  di.registerLazySingleton<IProductRepository>(
      () => PriceRepository(di(), di()));
  di.registerLazySingleton<IProductRemoteData>(() => ProductRemoteData(di()));
}
