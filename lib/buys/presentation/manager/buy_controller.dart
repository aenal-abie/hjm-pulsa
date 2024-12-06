import 'package:pulsa/buys/domain/entities/product_entity.dart';
import '../../domain/use_cases/buy_product.dart';
import '../../domain/use_cases/get_products.dart';
import 'package:core/utils/get.dart';

class BuyController {
  final GetProducts _getProducts;
  final BuyProduct _buyProduct;

  BuyController(this._getProducts, this._buyProduct);
  var products = <ProductEntity>[].obs;
  var selectedProduct = ProductEntity().obs;
  var phone = ''.obs;

  void getProducts(String groupCode) async {
    var results = await _getProducts(groupCode);
    results.fold((fail) {}, (products) {
      this.products.value = products;
    });
  }

  void selectProduct(ProductEntity product) {
    selectedProduct.value = product;
  }

  void buyProduct() async {
    var param = setBuyProductParam();
    var results = await _buyProduct(param);
    results.fold((fail) {
      Get.snackbar('Gagal', 'Gagal membeli produk. ${fail.message}');
    }, (success) {
      Get.snackbar('Berhasil', 'Berhasil membeli produk');
    });
  }

  BuyProductParam setBuyProductParam() => BuyProductParam(
      productId: selectedProduct.value.id, phoneNumber: phone.value);
}
