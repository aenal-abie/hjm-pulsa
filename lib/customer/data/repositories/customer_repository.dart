import 'package:either_dart/either.dart';
import 'package:pulsa/core/data/remotes/custom_exception.dart';
import 'package:pulsa/customer/data/remote/data_sources/abstract/customer_remote.dart';
import 'package:pulsa/customer/domain/use_cases/get_customer.dart';

import '../../../authentication/data/local/data_sources/base/authentication_cache.dart';
import '../../domain/repositories/customer_repository.dart';
import '../../domain/use_cases/Inquiry_electricity.dart';

class CustomerRepository extends ICustomerRepository {
  final ICustomerRemote customerRemote;
  final IAuthenticationCache authenticationCache;

  CustomerRepository(this.customerRemote, this.authenticationCache);

  Future<String> get getToken async =>
      await authenticationCache.getToken() ?? "";

  @override
  EInquiryElectricity getCustomerNumber(String customerNo) async {
    try {
      var data =
          await customerRemote.getCustomerNumber(customerNo, await getToken);
      return Right(data.toEntity());
    } on CustomException catch (e) {
      return Left(e.toFailure());
    }
  }

  @override
  EGetCustomer getCustomer() async {
    try {
      var data = await customerRemote.getCustomer(await getToken);
      return Right(data.toEntity());
    } on CustomException catch (e) {
      return Left(e.toFailure());
    }
  }
}
