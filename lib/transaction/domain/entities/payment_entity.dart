class PaymentEntity {
  PaymentEntity({
    this.id,
    this.total,
    this.createdAt,
    this.updatedAt,
  });

  num? id;
  num? total;
  String? createdAt;
  String? updatedAt;

  PaymentEntity copyWith({
    num? id,
    num? total,
    String? createdAt,
    String? updatedAt,
  }) =>
      PaymentEntity(
        id: id ?? this.id,
        total: total ?? this.total,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
}
