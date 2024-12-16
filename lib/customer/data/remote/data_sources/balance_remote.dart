import 'package:pulsa/customer/data/remote/models/balance_dto.dart';

import '../../../../core/data/remotes/api_provider.dart';
import 'abstract/balance_remote.dart';

class BalanceRemote extends IBalanceRemote {
  final ApiProvider apiProvider;

  BalanceRemote(this.apiProvider);

  @override
  Future<BalanceDto> getBalance(String authToken) async {
    var result =
        await apiProvider.get("customers/bills/balance", authToken: authToken);

    return BalanceDto.fromJson(result['data']);
  }
}
