import 'package:pulsa/product/domain/entities/product_entity.dart';

enum TransactionStatus {
  pending("Pending"),
  success("Sukses"),
  failed("Gagal");

  final String value;

  const TransactionStatus(this.value);
}

class TransactionEntity {
  TransactionEntity({
    this.id,
    this.customerId,
    this.productId,
    this.price,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.phoneNumber,
    this.trxId,
    this.refId,
    this.sn,
    this.productEntity,
  });

  int? id;
  int? customerId;
  int? productId;
  int? price;
  String? status;
  String? createdAt;
  String? updatedAt;
  String? phoneNumber;
  String? trxId;
  String? refId;
  String? sn;
  ProductEntity? productEntity;

  TransactionEntity copyWith({
    int? id,
    int? customerId,
    int? productId,
    int? price,
    String? status,
    String? createdAt,
    String? updatedAt,
    String? phoneNumber,
    String? trxId,
    String? refId,
    String? sn,
  }) =>
      TransactionEntity(
        id: id ?? this.id,
        customerId: customerId ?? this.customerId,
        productId: productId ?? this.productId,
        price: price ?? this.price,
        status: status ?? this.status,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        trxId: trxId ?? this.trxId,
        refId: refId ?? this.refId,
        sn: sn ?? this.sn,
      );

  DateTime get getCreatedAt =>
      DateTime.parse(createdAt ?? DateTime.now().toString()).toLocal();
}
