import 'package:pulsa/buys/domain/use_cases/get_prices.dart';

import '../../dto/product_dto.dart';



abstract class IProductRemoteData {
  Future<List<ProductDTO>> getProducts();
}