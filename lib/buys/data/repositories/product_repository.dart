import 'package:pulsa/buys/data/remote/data_sources/abstract/product_remote_data.dart';
import 'package:pulsa/buys/domain/use_cases/buy_product.dart';
import 'package:pulsa/buys/domain/use_cases/get_products.dart';
import '../../../core/domain/use_cases/either.dart';
import '../../domain/repositories/product_repository.dart';

class PriceRepository extends IProductRepository {
  final IProductRemoteData product;
  PriceRepository(this.product);
  @override
  EGetProducts getProducts() async {
    var data = await product.getProducts();
    return Right(data.map((e) => e.toEntity()).toList());
  }

  @override
  EBuyProduct buyProduct(BuyProductParam param) async{
    var data = await product.buyProduct(param);
    return const Right(true);
  }
}
