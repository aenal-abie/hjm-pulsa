import 'package:core/di/container.dart';
import 'package:core/domain/usecases/usecase.dart';
import 'package:pulsa/buys/domain/entities/product_entity.dart';
import '../../domain/use_cases/get_products.dart';
import 'package:core/utils/get.dart';

class BuyController {
  final GetProducts _getProducts;

  BuyController(this._getProducts);
  var products = <ProductEntity>[].obs;
  var selectedProduct = ProductEntity().obs;
  void getProducts(String groupCode) async {
    var results = await _getProducts(groupCode);
    results.fold((fail) {}, (products) {
      this.products.value = products;
    });
  }

  void selectProduct(ProductEntity product) {
    selectedProduct.value = product;
  }
}
