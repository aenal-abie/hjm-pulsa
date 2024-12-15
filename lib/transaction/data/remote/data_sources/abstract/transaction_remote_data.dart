import '../../../../domain/use_cases/buy_product.dart';

abstract class ITransactionRemoteData {
  Future<bool> buyProduct(BuyProductParam param, String authToken);
}
