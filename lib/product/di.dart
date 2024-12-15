import '../core/di/container.dart';
import '../product/data/repositories/product_repository.dart';
import '../product/domain/repositories/product_repository.dart';
import '../product/domain/use_cases/get_products.dart';
import 'data/remote/data_sources/abstract/product_remote_data.dart';
import 'data/remote/data_sources/product_remote.dart';

Future<void> injectProduct() async {
  di.registerLazySingleton(() => GetProducts(di()));
  di.registerLazySingleton<IProductRepository>(
      () => PriceRepository(di(), di()));
  di.registerLazySingleton<IProductRemoteData>(() => ProductRemoteData(di()));
}
