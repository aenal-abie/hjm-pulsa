import 'package:core/common/domain/use_cases/functional.dart';
import 'package:core/domain/error/failures.dart';
import 'package:core/domain/usecases/usecase.dart';
import 'package:pulsa/buys/domain/entities/product_entity.dart';

import '../repositories/product_repository.dart';

typedef EGetProducts = Future<Either<Failure, List<ProductEntity>>>;

class GetProducts extends UseCase<List<ProductEntity>, String> {
  final IProductRepository productRepository;
  GetProducts(this.productRepository);

  @override
  EGetProducts call(String params) async {
    var data = productRepository.getProducts();
    return data;
  }
}
