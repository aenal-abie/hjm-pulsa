import '../../../../core/data/remotes/api_provider.dart';
import '../../../domain/use_cases/get_products.dart';
import '../dto/product_dto.dart';
import 'abstract/product_remote_data.dart';

class ProductRemoteData extends IProductRemoteData {
  final ApiProvider apiProvider;

  ProductRemoteData(this.apiProvider);

  @override
  Future<List<ProductDTO>> getProducts(
      GetProductsParam params, String authToken) async {
    var result = await apiProvider.get(
        "categories/${params.categoryCode}/groups/${params.groupCode}/products",
        authToken: authToken);

    return (result['data'] as List).map((e) => ProductDTO.fromJson(e)).toList();
  }
}
