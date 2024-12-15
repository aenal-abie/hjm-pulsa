import 'package:pulsa/product/domain/entities/product_entity.dart';

import '../../../core/domain/error/failures.dart';
import '../../../core/domain/use_cases/either.dart';
import '../../../core/domain/use_cases/usecase.dart';
import '../repositories/product_repository.dart';

typedef EGetProducts = Future<Either<Failure, List<ProductEntity>>>;

class GetProducts extends UseCase<List<ProductEntity>, String> {
  final IProductRepository productRepository;
  GetProducts(this.productRepository);

  @override
  EGetProducts call(String params) async {
    var data = productRepository.getProducts(params);
    return data;
  }
}
