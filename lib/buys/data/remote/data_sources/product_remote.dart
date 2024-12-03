import 'dart:convert';

import 'package:pulsa/buys/data/remote/dto/product_dto.dart';
import 'package:pulsa/buys/domain/use_cases/get_products.dart';
import 'package:core/data/data_sources/remotes/api_provider.dart';
import 'abstract/product_remote_data.dart';

class ProductRemoteData extends IProductRemoteData {
  final ApiProvider apiProvider;

  ProductRemoteData(this.apiProvider);

  @override
  Future<List<ProductDTO>> getProducts() async {
    // var result = apiProvider.get("api/prices");
    var json = [
      {
        "code": "001",
        "name": "Product A",
        "price": 100,
        "selling_price": 120,
        "group_id": 1
      },
      {
        "code": "002",
        "name": "Product B",
        "price": 200,
        "selling_price": 240,
        "group_id": 2
      },
      {
        "code": "003",
        "name": "Product C",
        "price": 5000,
        "selling_price": 360,
        "group_id": 1
      }
    ];

    return (json as List).map((e) => ProductDTO.fromJson(e)).toList();
  }
}
