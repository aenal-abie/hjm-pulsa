import 'package:pulsa/buys/domain/use_cases/buy_product.dart';

import '../use_cases/get_products.dart';

abstract class IProductRepository {
  EGetProducts getProducts();
  EBuyProduct buyProduct(BuyProductParam param);

}