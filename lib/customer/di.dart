import '../core/di/container.dart';
import 'data/remote/data_sources/abstract/balance_remote.dart';
import 'data/remote/data_sources/abstract/customer_remote.dart';
import 'data/remote/data_sources/balance_remote.dart';
import 'data/remote/data_sources/customer_remote.dart';
import 'data/repositories/balance_repository.dart';
import 'data/repositories/customer_repository.dart';
import 'domain/repositories/balance_repository.dart';
import 'domain/repositories/customer_repository.dart';
import 'domain/use_cases/Inquiry_electricity.dart';
import 'domain/use_cases/get_balance.dart';

void injectCustomer() {
  di.registerLazySingleton(() => GetBalance(di()));
  di.registerLazySingleton(() => InquiryElectricity(di()));
  di.registerLazySingleton<IBalanceRepository>(
      () => BalanceRepository(di(), di()));
  di.registerLazySingleton<ICustomerRepository>(
      () => CustomerRepository(di(), di()));
  di.registerLazySingleton<IBalanceRemote>(() => BalanceRemote(di()));
  di.registerLazySingleton<ICustomerRemote>(() => CustomerRemote(di()));
}
