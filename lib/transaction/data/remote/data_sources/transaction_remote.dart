import 'package:pulsa/transaction/data/remote/data_sources/abstract/transaction_remote_data.dart';
import 'package:pulsa/transaction/data/remote/dto/transaction_dto.dart';

import '../../../../core/data/remotes/api_provider.dart';
import '../../../domain/use_cases/buy_product.dart';

class TransactionRemote extends ITransactionRemoteData {
  final ApiProvider apiProvider;

  TransactionRemote(this.apiProvider);

  @override
  Future<TransactionDto> buyProduct(
      BuyProductParam param, String authToken) async {
    var data = await apiProvider.post("transactions", param.toJson(),
        authToken: authToken);
    return TransactionDto.fromJson(data['data']);
  }

  @override
  Future<TransactionDto> getTransaction(int id, String authToken) async {
    var data = await apiProvider.get("transactions/$id", authToken: authToken);
    return TransactionDto.fromJson(data['data']);
  }

  @override
  Future<List<TransactionDto>> getTransactions(
      int page, String authToken) async {
    var data = await apiProvider.get("transactions",
        authToken: authToken, queryParameters: {"page": page});
    return (data['data']['data'] as List)
        .map((e) => TransactionDto.fromJson(e))
        .toList();
  }
}
