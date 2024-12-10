import 'package:pulsa/buys/domain/entities/product_entity.dart';

import '../../../core/domain/error/failures.dart';
import '../../../core/domain/use_cases/either.dart';
import '../../../core/domain/use_cases/usecase.dart';
import '../repositories/product_repository.dart';

typedef EBuyProduct = Future<Either<Failure, bool>>;

class BuyProduct extends UseCase<bool, BuyProductParam> {
  final IProductRepository productRepository;
  BuyProduct(this.productRepository);

  @override
  EBuyProduct call(BuyProductParam params) async {
    var data = productRepository.buyProduct(params);
    return data;
  }
}

class BuyProductParam {
  BuyProductParam({
    this.productId,
    this.phoneNumber,
  });

  int? productId;
  String? phoneNumber;

  BuyProductParam copyWith({
    int? productId,
    String? phoneNumber,
  }) =>
      BuyProductParam(
        productId: productId ?? this.productId,
        phoneNumber: phoneNumber ?? this.phoneNumber,
      );

  Map<String, dynamic> toJson() => {
        'product_id': productId,
        'phone_number': phoneNumber,
      };
}
