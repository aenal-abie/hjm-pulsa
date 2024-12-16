import '../../../core/domain/error/failures.dart';
import '../../../core/domain/use_cases/either.dart';
import '../../../core/domain/use_cases/usecase.dart';
import '../entities/balance_entity.dart';
import '../repositories/balance_repository.dart';

typedef EGetBalance = Future<Either<Failure, BalanceEntity>>;

class GetBalance extends UseCase<BalanceEntity, NoParams> {
  final IBalanceRepository balanceRepository;

  GetBalance(this.balanceRepository);

  @override
  EGetBalance call(NoParams params) async {
    var data = balanceRepository.getBalance();
    return data;
  }
}
