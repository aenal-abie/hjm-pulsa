import '../use_cases/Inquiry_electricity.dart';

abstract class ICustomerRepository {
  EInquiryElectricity getCustomerNumber(String customerNo);
}
