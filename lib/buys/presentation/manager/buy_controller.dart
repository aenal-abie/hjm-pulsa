import 'package:get/get.dart';
import 'package:pulsa/buys/domain/entities/product_entity.dart';

import '../../domain/entities/provider_type.dart';
import '../../domain/use_cases/buy_product.dart';
import '../../domain/use_cases/get_products.dart';

class BuyController {
  final GetProducts _getProducts;
  final BuyProduct _buyProduct;

  BuyController(this._getProducts, this._buyProduct);
  var products = <ProductEntity>[].obs;
  var selectedProduct = ProductEntity().obs;
  var phoneNumber = ''.obs;

  bool get emptyList => products.isEmpty || phoneNumber.isEmpty;

  void getProducts(String phoneNumber) async {
    var groupCode = getOperatorName(phoneNumber);
    var results = await _getProducts(groupCode ?? "");
    results.fold((fail) {}, (products) {
      this.products.value = products;
    });
  }

  void selectProduct(ProductEntity product) {
    selectedProduct.value = product;
  }

  Future<bool> buyProduct() async {
    var success = false;
    var param = setBuyProductParam();
    var results = await _buyProduct(param);
    results.fold((fail) {
      Get.snackbar('Gagal', 'Gagal membeli produk. ${fail.message}');
    }, (_) {
      success = true;
    });
    return success;
  }

  BuyProductParam setBuyProductParam() => BuyProductParam(
      productId: selectedProduct.value.id, phoneNumber: phoneNumber.value);

  void setPhoneNumber(String value) {
    if (value.length == 4) {
      getProducts(value);
    } else if (value.length < 4) {
      products.clear();
    }
    phoneNumber.value = value;
  }
}
