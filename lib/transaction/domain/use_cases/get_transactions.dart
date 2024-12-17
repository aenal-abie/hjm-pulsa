import 'package:pulsa/transaction/domain/entities/transaction_entity.dart';
import 'package:pulsa/transaction/domain/repositories/transaction_repository.dart';

import '../../../core/domain/error/failures.dart';
import '../../../core/domain/use_cases/either.dart';
import '../../../core/domain/use_cases/usecase.dart';

typedef EGetTransactions = Future<Either<Failure, List<TransactionEntity>>>;

class GetTransactions extends UseCase<List<TransactionEntity>, int> {
  final ITransactionRepository transactionRepository;

  GetTransactions(this.transactionRepository);

  @override
  EGetTransactions call(int params) async {
    try {
      return await transactionRepository.getTransactions(params);
    } catch (e) {
      return Left(InvalidParam(message: e.toString()));
    }
  }
}
