import 'package:pulsa/transaction/domain/entities/transaction_entity.dart';
import 'package:pulsa/transaction/domain/repositories/transaction_repository.dart';

import '../../../core/domain/error/failures.dart';
import '../../../core/domain/use_cases/either.dart';
import '../../../core/domain/use_cases/usecase.dart';
import '../../../product/domain/entities/category_entity.dart';

typedef EBuyProduct = Future<Either<Failure, TransactionEntity>>;

class BuyProduct extends UseCase<TransactionEntity, BuyProductParam> {
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
    this.customerNumber,
    this.pin,
    this.category,
  });

  int? productId;
  String? pin;
  String? customerNumber;
  Category? category;

  void isValid() {
    if (!validateCustomerNumber) {
      throw InvalidParam(message: getInvalidCustomerNumberMessage);
    } else if (!isProductValid) {
      throw InvalidParam(message: 'Anda belum memilih paket pulsa');
    }
  }

  BuyProductParam copyWith({
    int? productId,
    String? phoneNumber,
  }) =>
      BuyProductParam(
        productId: productId ?? this.productId,
        customerNumber: phoneNumber ?? this.customerNumber,
      );

  Map<String, dynamic> toJson() => {
        'product_id': productId,
        'phone_number': customerNumber,
        'pin': pin,
      };

  bool get isProductValid => productId != null;

  bool get validateCustomerNumber => (category == Category.electricity)
      ? isPlnNumberValid()
      : isPhoneNumberValid();

  get getInvalidCustomerNumberMessage => category == Category.electricity
      ? 'ID Pelanggan/No Meter tidak sesuai, harus 11-12 angka'
      : 'Nomor telepon tidak sesuai, harus 10-15 angka';

  bool isPhoneNumberValid() {
    final regex = RegExp(r'^\d{10,15}$');
    return customerNumber != null && regex.hasMatch(customerNumber!);
  }

  bool isPlnNumberValid() {
    final regex = RegExp(r'^\d{11,12}$');
    return customerNumber != null && regex.hasMatch(customerNumber!);
  }
}
