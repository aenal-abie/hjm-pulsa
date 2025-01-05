import 'package:pulsa/transaction/domain/entities/payment_entity.dart';

class PaymentDto {
  PaymentDto({
    this.id,
    this.total,
    this.createdAt,
    this.updatedAt,
  });

  PaymentDto.fromJson(dynamic json) {
    id = json['id'];
    total = json['total'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  num? id;
  num? total;
  String? createdAt;
  String? updatedAt;

  PaymentDto copyWith({
    num? id,
    num? total,
    String? createdAt,
    String? updatedAt,
  }) =>
      PaymentDto(
        id: id ?? this.id,
        total: total ?? this.total,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['total'] = total;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }

  PaymentEntity toEntity() => PaymentEntity(
        id: id,
        total: total,
        createdAt: createdAt,
        updatedAt: updatedAt,
      );
}
