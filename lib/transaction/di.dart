import 'package:pulsa/transaction/data/remote/data_sources/abstract/transaction_remote_data.dart';
import 'package:pulsa/transaction/data/remote/data_sources/transaction_remote.dart';
import 'package:pulsa/transaction/domain/repositories/transaction_repository.dart';

import '../core/di/container.dart';
import 'data/repositories/transaction_repository.dart';
import 'domain/use_cases/buy_product.dart';

Future<void> injectTransactions() async {
  di.registerLazySingleton(() => BuyProduct(di()));
  di.registerLazySingleton<ITransactionRepository>(
      () => TransactionRepository(di(), di()));
  di.registerLazySingleton<ITransactionRemoteData>(
      () => TransactionRemote(di()));
}
