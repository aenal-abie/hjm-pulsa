import 'package:pulsa/product/data/remote/dto/product_dto.dart';
import 'package:pulsa/transaction/domain/entities/transaction_dto.dart';

class TransactionDto {
  TransactionDto({
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
    this.productDTO,
  });

  TransactionDto.fromJson(dynamic json) {
    id = json['id'];
    customerId = json['customer_id'];
    productId = json['product_id'];
    price = json['price'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    phoneNumber = json['phone_number'];
    trxId = json['trx_id'];
    refId = json['ref_id'];
    sn = json['sn'];
    productDTO =
        json['product'] != null ? ProductDTO.fromJson(json['product']) : null;
  }
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
  ProductDTO? productDTO;

  TransactionDto copyWith({
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
      TransactionDto(
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
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['customer_id'] = customerId;
    map['product_id'] = productId;
    map['price'] = price;
    map['status'] = status;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    map['phone_number'] = phoneNumber;
    map['trx_id'] = trxId;
    map['ref_id'] = refId;
    map['sn'] = sn;
    map['product'] = productDTO?.toJson();
    return map;
  }

  TransactionEntity toEntity() => TransactionEntity(
        id: id,
        customerId: customerId,
        productId: productId,
        price: price,
        status: status,
        createdAt: createdAt,
        updatedAt: updatedAt,
        phoneNumber: phoneNumber,
        trxId: trxId,
        refId: refId,
        sn: sn,
        productEntity: productDTO?.toEntity(),
      );
}
