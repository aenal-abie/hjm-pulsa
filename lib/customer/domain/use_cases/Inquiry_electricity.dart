import '../../../core/domain/error/failures.dart';
import '../../../core/domain/use_cases/either.dart';
import '../../../core/domain/use_cases/usecase.dart';
import '../entities/electricity_number_entity].dart';
import '../repositories/customer_repository.dart';

typedef EInquiryElectricity = Future<Either<Failure, ElectricityNumberEntity>>;

class InquiryElectricity extends UseCase<ElectricityNumberEntity, String> {
  final ICustomerRepository customerRepository;

  InquiryElectricity(this.customerRepository);

  @override
  EInquiryElectricity call(String params) async {
    var data = customerRepository.getCustomerNumber(params);
    return data;
  }
}
