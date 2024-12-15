class Transaction {
  Transaction({
    this.id,
    this.phoneNumber,
    this.price,
    this.status,
    this.trxId,
    this.sn,
    this.refId,
  });

  num? id;
  String? phoneNumber;
  num? price;
  String? status;
  String? trxId;
  String? sn;
  String? refId;

  Transaction copyWith({
    num? id,
    String? phoneNumber,
    num? price,
    String? status,
    dynamic trxId,
    dynamic sn,
    String? refId,
  }) =>
      Transaction(
        id: id ?? this.id,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        price: price ?? this.price,
        status: status ?? this.status,
        trxId: trxId ?? this.trxId,
        sn: sn ?? this.sn,
        refId: refId ?? this.refId,
      );
}
