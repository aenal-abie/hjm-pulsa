import '../use_cases/get_prices.dart';

abstract class IProductRepository {
  GetPricesEither getProducts();
}