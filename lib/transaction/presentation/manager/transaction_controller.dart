import 'package:get/get.dart';
import 'package:pulsa/product/domain/entities/product_entity.dart';
import 'package:pulsa/transaction/domain/entities/transaction_dto.dart';
import 'package:pulsa/transaction/domain/use_cases/get_transaction.dart';

class TransactionController {
  final GetTransaction _getTransaction;

  TransactionController(this._getTransaction);

  var transaction = TransactionEntity().obs;
  var selectedProduct = ProductEntity().obs;
  var phoneNumber = ''.obs;
  var orderSuccess = false.obs;
  var secondNavigation = "0".obs;
  var getTransactionLoading = false.obs;

  void getTransaction(int id) async {
    getTransactionLoading.value = true;
    var results = await _getTransaction(id);
    results.fold((fail) {}, (transaction) {
      this.transaction.value = transaction;
    });
    getTransactionLoading.value = false;
  }
}
