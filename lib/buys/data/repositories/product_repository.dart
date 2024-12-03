import 'package:pulsa/buys/data/remote/data_sources/abstract/product_remote_data.dart';
import 'package:pulsa/buys/domain/entities/product_entity.dart';
import 'package:pulsa/buys/domain/use_cases/get_prices.dart';
import 'package:core/common/domain/use_cases/functional.dart';
import '../../domain/repositories/product_repository.dart';

class PriceRepository extends IProductRepository {
  final IProductRemoteData product;
  PriceRepository(this.product);
  @override
  GetPricesEither getProducts() async {
    var data = await product.getProducts();
    return Right(data.map((e) => e.toEntity()).toList());
  }
}
