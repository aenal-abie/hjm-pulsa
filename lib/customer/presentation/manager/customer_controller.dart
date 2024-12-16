import 'package:pulsa/customer/domain/entities/balance_entity.dart';
import 'package:pulsa/customer/domain/use_cases/get_balance.dart';

import '../../../core/domain/use_cases/usecase.dart';
import '../../../core/presentation/atoms/utils/gap.dart';

class CustomerController extends GetxController {
  final GetBalance _getBalance;
  var balance = BalanceEntity().obs;

  CustomerController(this._getBalance);

  void getBalance() {
    _getBalance(NoParams()).then((event) {
      if (event.isRight) {
        balance.value = event.right;
      }
    });
  }
}
