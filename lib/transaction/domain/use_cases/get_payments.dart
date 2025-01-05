import 'package:pulsa/transaction/domain/entities/payment_entity.dart';
import 'package:pulsa/transaction/domain/repositories/transaction_repository.dart';

import '../../../core/domain/error/failures.dart';
import '../../../core/domain/use_cases/either.dart';
import '../../../core/domain/use_cases/usecase.dart';

typedef EGetPayments = Future<Either<Failure, List<PaymentEntity>>>;

class GetPayments extends UseCase<List<PaymentEntity>, int> {
  final ITransactionRepository transactionRepository;

  GetPayments(this.transactionRepository);

  @override
  EGetPayments call(int params) async {
    try {
      return await transactionRepository.getPayments(params);
    } catch (e) {
      return Left(InvalidParam(message: e.toString()));
    }
  }
}
