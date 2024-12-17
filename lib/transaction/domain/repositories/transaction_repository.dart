import 'package:pulsa/transaction/domain/use_cases/get_transaction.dart';

import '../use_cases/buy_product.dart';
import '../use_cases/get_transactions.dart';

abstract class ITransactionRepository {
  EBuyProduct buyProduct(BuyProductParam param);

  EGetTransaction getTransaction(int id);

  EGetTransactions getTransactions(int page);
}