import 'dart:convert';

import 'package:pulsa/buys/data/remote/dto/product_dto.dart';
import 'package:pulsa/buys/domain/use_cases/buy_product.dart';
import 'package:pulsa/buys/domain/use_cases/get_products.dart';

import '../../../../core/data/remotes/api_provider.dart';
import 'abstract/product_remote_data.dart';

class ProductRemoteData extends IProductRemoteData {
  final ApiProvider apiProvider;

  ProductRemoteData(this.apiProvider);

  @override
  Future<List<ProductDTO>> getProducts() async {
    return [
      ProductDTO(
        id: 10,
        code: "P001",
        name: "XL 5Rb",
        price: 5000,
        sellingPrice: 5000,
        groupId: 1,
      ),
      ProductDTO(
        id: 1,
        code: "P002",
        name: "XL 10Rb",
        price: 10000,
        sellingPrice: 10000,
        groupId: 1,
      ),
      ProductDTO(
        id: 2,
        code: "P003",
        name: "XL 20Rb",
        price: 20000,
        sellingPrice: 20000,
        groupId: 1,
      ),
      ProductDTO(
        id: 3,
        code: "P004",
        name: "XL 25Rb",
        price: 25000,
        sellingPrice: 25000,
        groupId: 1,
      ),
      ProductDTO(
        id: 4,
        code: "P005",
        name: "XL 30Rb",
        price: 30000,
        sellingPrice: 30000,
        groupId: 1,
      ),
      ProductDTO(
        id: 5,
        code: "P006",
        name: "XL 40Rb",
        price: 40000,
        sellingPrice: 40000,
        groupId: 1,
      ),
      ProductDTO(
        id: 6,
        code: "P007",
        name: "XL 50Rb",
        price: 50000,
        sellingPrice: 50000,
        groupId: 1,
      ),
      ProductDTO(
        id: 7,
        code: "P008",
        name: "XL 75Rb",
        price: 75000,
        sellingPrice: 75000,
        groupId: 1,
      ),
      ProductDTO(
        id: 8,
        code: "P009",
        name: "XL 100Rb",
        price: 100000,
        sellingPrice: 100000,
        groupId: 1,
      ),
      ProductDTO(
        id: 9,
        code: "P010",
        name: "XL 150Rb",
        price: 150000,
        sellingPrice: 150000,
        groupId: 1,
      ),
      ProductDTO(
        id: 11,
        code: "P011",
        name: "XL 200Rb",
        price: 200000,
        sellingPrice: 200000,
        groupId: 1,
      ),
      ProductDTO(
        id: 12,
        code: "P012",
        name: "XL 250Rb",
        price: 250000,
        sellingPrice: 250000,
        groupId: 1,
      ),
      ProductDTO(
        id: 13,
        code: "P013",
        name: "XL 300Rb",
        price: 300000,
        sellingPrice: 300000,
        groupId: 1,
      ),
      ProductDTO(
        id: 14,
        code: "P014",
        name: "XL 400Rb",
        price: 400000,
        sellingPrice: 400000,
        groupId: 1,
      ),
      ProductDTO(
        id: 15,
        code: "P015",
        name: "XL 500Rb",
        price: 500000,
        sellingPrice: 500000,
        groupId: 1,
      ),
    ];
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
