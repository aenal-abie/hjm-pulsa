import 'package:pulsa/customer/domain/use_cases/get_customer.dart';

import '../core/di/container.dart';

void injectUser() {
  di.registerLazySingleton(() => GetCustomer(di()));
}
