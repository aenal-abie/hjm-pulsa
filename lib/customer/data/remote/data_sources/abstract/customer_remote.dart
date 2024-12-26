import 'package:pulsa/customer/data/local/models/customer_dto.dart';

import '../../models/electricity_number_dto.dart';

abstract class ICustomerRemote {
  Future<ElectricityNumberDto> getCustomerNumber(
      String customerNo, String authToken);

  Future<CustomerDto> getCustomer(String authToken);
}
