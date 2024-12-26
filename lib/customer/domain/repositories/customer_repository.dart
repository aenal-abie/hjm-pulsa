import '../use_cases/Inquiry_electricity.dart';
import '../use_cases/get_customer.dart';

abstract class ICustomerRepository {
  EInquiryElectricity getCustomerNumber(String customerNo);

  EGetCustomer getCustomer();
}
