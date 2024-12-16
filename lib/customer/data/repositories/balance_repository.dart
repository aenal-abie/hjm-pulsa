import 'package:pulsa/customer/domain/use_cases/get_balance.dart';

import '../../../authentication/data/local/data_sources/base/authentication_cache.dart';
import '../../../core/domain/use_cases/either.dart';
import '../../domain/repositories/balance_repository.dart';
import '../remote/data_sources/abstract/balance_remote.dart';

class BalanceRepository extends IBalanceRepository {
  final IBalanceRemote balanceRemote;
  final IAuthenticationCache authenticationCache;

  BalanceRepository(this.balanceRemote, this.authenticationCache);

  Future<String> get getToken async =>
      await authenticationCache.getToken() ?? "";

  @override
  EGetBalance getBalance() async {
    var data = await balanceRemote.getBalance(await getToken);
    return Right(data.toEntity());
  }
}
