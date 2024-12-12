import 'package:pulsa/buys/domain/use_cases/buy_product.dart';

import '../../dto/product_dto.dart';



abstract class IProductRemoteData {
  Future<List<ProductDTO>> getProducts(String authToken);

  Future<bool> buyProduct(BuyProductParam param, String authToken);
}