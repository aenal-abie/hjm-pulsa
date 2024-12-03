import 'package:core/common/domain/use_cases/functional.dart';
import 'package:core/domain/error/failures.dart';
import 'package:core/domain/usecases/usecase.dart';
import 'package:pulsa/buys/domain/entities/product_entity.dart';

import '../repositories/product_repository.dart';

typedef GetProductsEither = Future<Either<Failure, List<ProductEntity>>>;

class GetProducts extends UseCase<List<ProductEntity>, String> {
  final IProductRepository priceRepository;
  GetProducts(this.priceRepository);

  @override
  GetProductsEither call(String params) async {
    var data = priceRepository.getProducts();
    return data;
  }
}
