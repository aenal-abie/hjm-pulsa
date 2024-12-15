import 'package:pulsa/transaction/data/remote/data_sources/abstract/transaction_remote_data.dart';

import '../../../../core/data/remotes/api_provider.dart';
import '../../../domain/use_cases/buy_product.dart';

class TransactionRemote extends ITransactionRemoteData {
  final ApiProvider apiProvider;

  TransactionRemote(this.apiProvider);

  @override
  Future<bool> buyProduct(BuyProductParam param, String authToken) async {
    await apiProvider.post(
      "transactions",
      param.toJson(),
    );
    return true;
  }
}
