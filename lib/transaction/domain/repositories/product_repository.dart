import '../use_cases/buy_product.dart';
import '../use_cases/get_products.dart';

abstract class IProductRepository {
  EGetProducts getProducts(String params);
  EBuyProduct buyProduct(BuyProductParam param);

}