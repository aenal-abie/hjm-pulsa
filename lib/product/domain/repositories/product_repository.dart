import '../use_cases/get_products.dart';

abstract class IProductRepository {
  EGetProducts getProducts(GetProductsParam params);
}
