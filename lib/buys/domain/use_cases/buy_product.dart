import 'package:core/common/domain/use_cases/functional.dart';
import 'package:core/domain/error/failures.dart';
import 'package:core/domain/usecases/usecase.dart';
import 'package:pulsa/buys/domain/entities/product_entity.dart';

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
