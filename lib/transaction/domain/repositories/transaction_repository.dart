import '../use_cases/buy_product.dart';

abstract class ITransactionRepository {
  EBuyProduct buyProduct(BuyProductParam param);

}