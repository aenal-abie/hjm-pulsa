import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pulsa/core/presentation/atoms/style/colors.dart';
import 'package:pulsa/product/domain/entities/product_entity.dart';

import '../../../product/domain/entities/provider_type.dart';
import '../../domain/use_cases/buy_product.dart';
import '../../domain/use_cases/get_products.dart';
import '../pages/detail_payment_screen.dart';

class BuyController {
  final GetProducts _getProducts;
  final BuyProduct _buyProduct;

  BuyController(this._getProducts, this._buyProduct);
  var products = <ProductEntity>[].obs;
  var selectedProduct = ProductEntity().obs;
  var phoneNumber = ''.obs;
  var orderSuccess = false.obs;
  var secondNavigation = "0".obs;
  var getProductLoading = false.obs;

  bool get emptyList => products.isEmpty || phoneNumber.isEmpty;

  void getProducts(String phoneNumber) async {
    getProductLoading.value = true;
    var groupCode = getOperatorName(phoneNumber);
    var results = await _getProducts(groupCode ?? "");
    results.fold((fail) {}, (products) {
      this.products.value = products;
    });
    getProductLoading.value = false;
  }

  void selectProduct(ProductEntity product) {
    selectedProduct.value = product;
  }

  Future<bool> buyProduct() async {
    var success = false;
    secondNavigation.value = "";
    var param = setBuyProductParam();
    var results = await _buyProduct(param);
    results.fold((fail) {
      Get.back();
      Get.snackbar('Kesalahan', 'Gagal membeli produk. ${fail.message}',
          backgroundColor: natural[50],
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          snackPosition: SnackPosition.BOTTOM,
          colorText: brightRed);
    }, (_) {
      success = true;
      if (success) {
        navigateToDetail();
      }
    });
    return success;
  }

  void navigateToDetail() {
    var count = 3;
    Timer.periodic(Duration(seconds: 1), (timer) {
      if (count > 0) {
        secondNavigation.value = count.toString();
        count--;
      } else {
        orderSuccess.value = true;
        timer.cancel();
        Get.back();
        Get.back();
        Get.to(DetailPaymentScreen());
      }
    });
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
