import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pulsa/core/domain/use_cases/either.dart';
import 'package:pulsa/core/presentation/atoms/style/colors.dart';
import 'package:pulsa/customer/domain/use_cases/Inquiry_electricity.dart';
import 'package:pulsa/product/domain/entities/product_entity.dart';
import 'package:pulsa/transaction/domain/entities/transaction_entity.dart';

import '../../../customer/domain/entities/electricity_number_entity].dart';
import '../../../product/domain/entities/category_entity.dart';
import '../../../product/domain/entities/provider_type.dart';
import '../../../product/domain/use_cases/get_products.dart';
import '../../domain/use_cases/buy_product.dart';
import '../pages/transaction_screen.dart';

class BuyController {
  final GetProducts _getProducts;
  final BuyProduct _buyProduct;
  final InquiryElectricity _inquiryElectricity;

  BuyController(this._getProducts, this._buyProduct, this._inquiryElectricity);
  var products = <ProductEntity>[].obs;
  var selectedProduct = ProductEntity().obs;
  var phoneNumber = ''.obs;
  var electricityNumber = ''.obs;
  var orderSuccess = false.obs;
  var secondNavigation = "0".obs;
  var getProductLoading = false.obs;
  var category = Category.voice;
  var group = "".obs;

  var electricityNumberEntity = ElectricityNumberEntity().obs;
  var eWalletName = "".obs;

  bool get emptyList => products.isEmpty || phoneNumber.isEmpty;

  bool get enableSendButton =>
      selectedProduct.value.id != null && validCustomer;

  bool get validCustomer => category == Category.electricity
      ? electricityNumber.isNotEmpty
      : phoneNumber.isNotEmpty;

  void getProducts(String categoryCode, String groupCode) async {
    getProductLoading.value = true;
    var param =
        GetProductsParam(categoryCode: categoryCode, groupCode: groupCode);
    var results = await _getProducts(param);
    results.fold((fail) {}, (products) {
      this.products.value = products;
    });
    getProductLoading.value = false;
  }

  void selectProduct(ProductEntity product) {
    selectedProduct.value = product;
  }

  Future<bool> buyProduct(String pin, Category packetType) async {
    var success = false;
    secondNavigation.value = "";
    var param = setBuyProductParam(pin);
    var results = await _buyProduct(param);
    results.fold((fail) {
      Get.back();
      Get.snackbar('Kesalahan', 'Gagal membeli produk. ${fail.message}',
          backgroundColor: natural[50],
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          snackPosition: SnackPosition.BOTTOM,
          colorText: brightRed);
    }, (result) {
      success = true;
      if (success) {
        navigateToDetail(result);
      }
    });
    return success;
  }

  void navigateToDetail(TransactionEntity transaction) {
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
        Get.to(TransactionScreen(
          transactionId: transaction.id ?? 0,
        ));
      }
    });
  }

  BuyProductParam setBuyProductParam(String pin) => BuyProductParam(
      productId: selectedProduct.value.id,
      customerNumber: category == Category.electricity
          ? electricityNumber.value
          : phoneNumber.value,
      category: category,
      pin: pin);

  void setPhoneNumber(String phoneNumber, Category packetType) {
    if (phoneNumber.length == 4) {
      var groupCode = getOperatorName(phoneNumber);
      group.value = groupCode?.toLowerCase() ?? "";
      category = packetType;
      getProducts(packetType.value, groupCode ?? "");
    } else if (phoneNumber.length < 4) {
      products.clear();
      selectedProduct.value = ProductEntity();
      group.value = "";
    }
    this.phoneNumber.value = phoneNumber;
  }

  void setWalletNumber(String phoneNumber, Category packetType) {
    this.phoneNumber.value = phoneNumber;
  }

  void setElectricityNumber(String electricityNumber) {
    category = Category.electricity;
    if (electricityNumber.length >= 11) {
      // todo: check electricityNumber
      this.electricityNumber.value = electricityNumber;
      _checkPlnNumber(electricityNumber);
    } else {
      this.electricityNumber.value = "";
      electricityNumberEntity.value = ElectricityNumberEntity();
    }
  }

  void _checkPlnNumber(String electricityNumber) async {
    await _inquiryElectricity(electricityNumber).fold((fail) {}, (result) {
      electricityNumberEntity.value = result;
    });
  }
}
