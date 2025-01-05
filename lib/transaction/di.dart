import 'package:pulsa/transaction/data/remote/data_sources/abstract/transaction_remote_data.dart';
import 'package:pulsa/transaction/data/remote/data_sources/transaction_remote.dart';
import 'package:pulsa/transaction/domain/repositories/transaction_repository.dart';
import 'package:pulsa/transaction/domain/use_cases/get_payments.dart';
import 'package:pulsa/transaction/domain/use_cases/get_transaction.dart';

import '../core/di/container.dart';
import 'data/repositories/transaction_repository.dart';
import 'domain/use_cases/buy_product.dart';
import 'domain/use_cases/get_transactions.dart';

Future<void> injectTransactions() async {
  di.registerLazySingleton(() => GetPayments(di()));
  di.registerLazySingleton(() => BuyProduct(di()));
  di.registerLazySingleton(() => GetTransaction(di()));
  di.registerLazySingleton(() => GetTransactions(di()));
  di.registerLazySingleton<ITransactionRepository>(
      () => TransactionRepository(di(), di()));
  di.registerLazySingleton<ITransactionRemoteData>(
      () => TransactionRemote(di()));
}
