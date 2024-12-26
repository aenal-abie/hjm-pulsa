class CustomerEntity {
  CustomerEntity({
    this.name,
    this.type,
    this.phoneNumber,
    this.balance,
    this.address,
  });

  String? name;
  String? type;
  String? phoneNumber;
  num? balance;
  String? address;

  CustomerEntity copyWith({
    String? name,
    String? type,
    String? phoneNumber,
    num? balance,
    String? address,
  }) =>
      CustomerEntity(
        name: name ?? this.name,
        type: type ?? this.type,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        balance: balance ?? this.balance,
        address: address ?? this.address,
      );
}
