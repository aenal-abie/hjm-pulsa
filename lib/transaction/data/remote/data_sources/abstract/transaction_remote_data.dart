import 'package:pulsa/transaction/data/remote/dto/payment_dto.dart';
import 'package:pulsa/transaction/data/remote/dto/transaction_dto.dart';

import '../../../../domain/use_cases/buy_product.dart';

abstract class ITransactionRemoteData {
  Future<TransactionDto> buyProduct(BuyProductParam param, String authToken);

  Future<TransactionDto> getTransaction(int id, String authToken);

  Future<List<TransactionDto>> getTransactions(int page, String authToken);

  Future<List<PaymentDto>> getPayments(int page, String authToken);
}
