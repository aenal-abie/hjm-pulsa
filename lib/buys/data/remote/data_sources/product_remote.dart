import 'package:pulsa/buys/data/remote/dto/product_dto.dart';
import 'package:pulsa/buys/domain/use_cases/buy_product.dart';

import '../../../../core/data/remotes/api_provider.dart';
import 'abstract/product_remote_data.dart';

class ProductRemoteData extends IProductRemoteData {
  final ApiProvider apiProvider;

  ProductRemoteData(this.apiProvider);

  @override
  Future<List<ProductDTO>> getProducts(String authToken) async {
    var result = await apiProvider.get("products", authToken: authToken);

    return (result['data'] as List).map((e) => ProductDTO.fromJson(e)).toList();
  }

  @override
  Future<bool> buyProduct(BuyProductParam param, String authToken) async {
    await apiProvider.post(
      "transactions",
      param.toJson(),
    );
    return true;
  }
}
