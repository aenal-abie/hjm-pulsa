import 'package:pulsa/core/domain/use_cases/usecase.dart';
import 'package:pulsa/customer/domain/entities/customer_entity.dart';
import 'package:pulsa/customer/domain/use_cases/get_customer.dart';

import '../../../core/presentation/atoms/utils/gap.dart';

class UserController extends GetxController {
  final GetCustomer _getCustomer;

  UserController(this._getCustomer);

  var customer = CustomerEntity().obs;

  @override
  void onInit() {
    super.onInit();
    getCustomer();
  }

  Future<void> getCustomer() async {
    final result = await _getCustomer(NoParams());
    result.fold((l) => null, (r) => customer.value = r);
  }
}
