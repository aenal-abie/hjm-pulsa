import 'package:get/get.dart';
import 'package:pulsa/product/domain/entities/product_entity.dart';
import 'package:pulsa/transaction/domain/entities/transaction_entity.dart';
import 'package:pulsa/transaction/domain/use_cases/get_transaction.dart';

import '../../domain/use_cases/get_transactions.dart';

class TransactionController {
  final GetTransaction _getTransaction;
  final GetTransactions _getTransactions;

  TransactionController(this._getTransaction, this._getTransactions);

  var transactions = <TransactionEntity>[].obs;
  var transaction = TransactionEntity().obs;
  var selectedProduct = ProductEntity().obs;
  var phoneNumber = ''.obs;
  var orderSuccess = false.obs;
  var secondNavigation = "0".obs;
  var getTransactionLoading = false.obs;
  var getTransactionsLoading = false.obs;
  bool hasMaxReached = false;
  var currentPage = 0;

  void getTransaction(int id) async {
    getTransactionLoading.value = true;
    var results = await _getTransaction(id);
    results.fold((fail) {}, (transaction) {
      this.transaction.value = transaction;
    });
    getTransactionLoading.value = false;
  }

  void getTransactions({bool initPage = false}) async {
    if (initPage) {
      transactions.clear();
      getTransactionsLoading.value = true;
      currentPage = 1;
      hasMaxReached = false;
    } else {
      currentPage++;
    }
    if (hasMaxReached) return;
    var results = await _getTransactions(currentPage);
    results.fold((fail) {}, (transactions) {
      this.transactions.value = this.transactions.value + transactions;
      hasMaxReached = transactions.isEmpty || transactions.length < 20;
    });
    getTransactionsLoading.value = false;
  }
}
