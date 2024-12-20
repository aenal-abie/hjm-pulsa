import '../../models/electricity_number_dto.dart';

abstract class ICustomerRemote {
  Future<ElectricityNumberDto> getCustomerNumber(
      String customerNo, String authToken);
}
