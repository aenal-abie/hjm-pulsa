import 'package:pulsa/customer/data/remote/models/electricity_number_dto.dart';

import '../../../../core/data/remotes/api_provider.dart';
import 'abstract/customer_remote.dart';

class CustomerRemote extends ICustomerRemote {
  final ApiProvider apiProvider;

  CustomerRemote(this.apiProvider);

  @override
  Future<ElectricityNumberDto> getCustomerNumber(
      String customerNo, String authToken) async {
    var url = "customers/validate/validate-pln";
    var params = {"customer_no": customerNo};
    var result = await apiProvider.post(url, params, authToken: authToken);
    return ElectricityNumberDto.fromJson(result);
  }
}
