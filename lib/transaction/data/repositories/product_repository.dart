import '../../../authentication/data/local/data_sources/base/authentication_cache.dart';
import '../../../core/domain/error/failures.dart';
import '../../../core/domain/use_cases/either.dart';
import '../../domain/repositories/product_repository.dart';
import '../../domain/use_cases/buy_product.dart';
import '../../domain/use_cases/get_products.dart';
import '../remote/data_sources/abstract/product_remote_data.dart';

class PriceRepository extends IProductRepository {
  final IProductRemoteData product;
  final IAuthenticationCache authenticationCache;

  PriceRepository(this.product, this.authenticationCache);
  @override
  EGetProducts getProducts(String params) async {
    var token = await authenticationCache.getToken();
    var data = await product.getProducts(params, token ?? "");

    return Right(data.map((e) => e.toEntity()).toList());
  }

  @override
  EBuyProduct buyProduct(BuyProductParam param) async {
    var token = await authenticationCache.getToken();
    try {
      await product.buyProduct(param, token ?? "");
      return const Right(true);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
