import 'package:pulsa/transaction/domain/entities/transaction_dto.dart';
import 'package:pulsa/transaction/domain/repositories/transaction_repository.dart';

import '../../../core/domain/error/failures.dart';
import '../../../core/domain/use_cases/either.dart';
import '../../../core/domain/use_cases/usecase.dart';

typedef EGetTransaction = Future<Either<Failure, TransactionEntity>>;

class GetTransaction extends UseCase<TransactionEntity, int> {
  final ITransactionRepository transactionRepository;

  GetTransaction(this.transactionRepository);

  @override
  EGetTransaction call(int params) async {
    try {
      return await transactionRepository.getTransaction(params);
    } catch (e) {
      return Left(InvalidParam(message: e.toString()));
    }
  }
}
