import 'package:core/common/domain/use_cases/functional.dart';
import 'package:core/domain/error/failures.dart';
import 'package:core/domain/usecases/usecase.dart';
import 'package:pulsa/buys/domain/entities/product_entity.dart';

import '../repositories/product_repository.dart';

typedef GetPricesEither = Future<Either<Failure, List<ProductEntity>>>;

class GetPrices extends UseCase<List<ProductEntity>, NoParams> {
  final IProductRepository priceRepository;
  GetPrices(this.priceRepository);

  @override
  GetPricesEither call(NoParams params) async {
    var data = priceRepository.getProducts();
    return data;
  }
}
