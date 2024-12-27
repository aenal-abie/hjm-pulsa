import 'package:pulsa/customer/domain/use_cases/get_customer.dart';
import 'package:pulsa/user/domain/use_cases/changing_pin.dart';

import '../core/di/container.dart';
import 'data/remote/data_sources/base/user_remote.dart';
import 'data/remote/data_sources/user_remote.dart';
import 'data/repositories/user_repository.dart';
import 'domain/repositories/user_repository.dart';

void injectUser() {
  di.registerLazySingleton(() => GetCustomer(di()));
  di.registerLazySingleton(() => ChangingPin(di()));
  di.registerLazySingleton<IUserRepository>(() => UserRepository(di(), di()));
  di.registerLazySingleton<IUserRemote>(() => UserRemote(di()));
}
