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

  @override
  EBuyProduct buyProduct(BuyProductParam param) async {
    var token = await authenticationCache.getToken();
    try {
      await transactionRemoteData.buyProduct(param, token ?? "");
      return const Right(true);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
