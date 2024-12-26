import '../../../core/domain/error/failures.dart';
import '../../../core/domain/use_cases/either.dart';
import '../../../core/domain/use_cases/usecase.dart';
import '../entities/customer_entity.dart';
import '../repositories/customer_repository.dart';

typedef EGetCustomer = Future<Either<Failure, CustomerEntity>>;

class GetCustomer extends UseCase<CustomerEntity, NoParams> {
  final ICustomerRepository customerRepository;

  GetCustomer(this.customerRepository);

  @override
  EGetCustomer call(NoParams params) async {
    var data = customerRepository.getCustomer();
    return data;
  }
}
