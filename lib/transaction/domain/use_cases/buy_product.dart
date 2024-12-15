import 'package:pulsa/transaction/domain/repositories/transaction_repository.dart';

import '../../../core/domain/error/failures.dart';
import '../../../core/domain/use_cases/either.dart';
import '../../../core/domain/use_cases/usecase.dart';

typedef EBuyProduct = Future<Either<Failure, bool>>;

class BuyProduct extends UseCase<bool, BuyProductParam> {
  final ITransactionRepository transactionRepository;

  BuyProduct(this.transactionRepository);

  @override
  EBuyProduct call(BuyProductParam params) async {
    try {
      params.isValid();
      var data = transactionRepository.buyProduct(params);
      return data;
    } catch (e) {
      return Left(InvalidParam(message: e.toString()));
    }
  }
}

class BuyProductParam {
  BuyProductParam({
    this.productId,
    this.phoneNumber,
  });

  int? productId;
  String? phoneNumber;

  void isValid() {
    if (!isPhoneNumberValid()) {
      throw InvalidParam(
          message: 'Nomor telepon tidak valid, harus 10-15 angka');
    } else if (!isProductValid()) {
      throw InvalidParam(message: 'Anda belum memilih paket pulsa');
    }
  }

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

  bool isProductValid() => productId != null;

  bool isPhoneNumberValid() {
    final regex = RegExp(r'^\d{10,15}$');
    return phoneNumber != null && regex.hasMatch(phoneNumber!);
  }
}
