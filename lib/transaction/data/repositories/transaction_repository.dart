import 'package:pulsa/transaction/domain/use_cases/get_transaction.dart';

import '../../../authentication/data/local/data_sources/base/authentication_cache.dart';
import '../../../core/domain/error/failures.dart';
import '../../../core/domain/use_cases/either.dart';
import '../../domain/repositories/transaction_repository.dart';
import '../../domain/use_cases/buy_product.dart';
import '../remote/data_sources/abstract/transaction_remote_data.dart';

class TransactionRepository extends ITransactionRepository {
  final ITransactionRemoteData transactionRemoteData;
  final IAuthenticationCache authenticationCache;

  TransactionRepository(this.transactionRemoteData, this.authenticationCache);

  Future<String?> get getToken async => await authenticationCache.getToken();

  @override
  EBuyProduct buyProduct(BuyProductParam param) async {
    try {
      var data =
          await transactionRemoteData.buyProduct(param, await getToken ?? "");
      return Right(data.toEntity());
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  EGetTransaction getTransaction(int id) async {
    try {
      var data =
          await transactionRemoteData.getTransaction(id, await getToken ?? "");
      return Right(data.toEntity());
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
