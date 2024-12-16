import 'package:pulsa/customer/data/remote/models/balance_dto.dart';

abstract class IBalanceRemote {
  Future<BalanceDto> getBalance(String authToken);
}
