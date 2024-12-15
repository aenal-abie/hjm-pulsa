import '../../dto/product_dto.dart';



abstract class IProductRemoteData {
  Future<List<ProductDTO>> getProducts(String params, String authToken);
}