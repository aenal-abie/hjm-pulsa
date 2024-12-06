import 'dart:convert';

import 'package:pulsa/buys/data/remote/dto/product_dto.dart';
import 'package:pulsa/buys/domain/use_cases/buy_product.dart';
import 'package:pulsa/buys/domain/use_cases/get_products.dart';
import 'package:core/data/data_sources/remotes/api_provider.dart';
import 'abstract/product_remote_data.dart';

class ProductRemoteData extends IProductRemoteData {
  final ApiProvider apiProvider;

  ProductRemoteData(this.apiProvider);

  @override
  Future<List<ProductDTO>> getProducts() async {
    var result = await apiProvider.get("api/products",
        authToken: "4|BZoCyNMcKi79AH2A941ERzKJocM6GJVV2qjCz7ylefa7600c");

    return (result['data'] as List).map((e) => ProductDTO.fromJson(e)).toList();
  }

  @override
  Future<bool> buyProduct(BuyProductParam param) async {
    await apiProvider.post("api/transactions", param.toJson(),
        authToken: "4|BZoCyNMcKi79AH2A941ERzKJocM6GJVV2qjCz7ylefa7600c");
    return true;
  }
}
