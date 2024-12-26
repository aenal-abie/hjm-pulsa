import 'package:pulsa/customer/domain/entities/customer_entity.dart';

class CustomerDto {
  CustomerDto({
    this.name,
    this.type,
    this.phoneNumber,
    this.balance,
    this.address,
  });

  CustomerDto.fromJson(dynamic json) {
    name = json['name'];
    type = json['type'];
    phoneNumber = json['phone_number'];
    balance = json['balance'];
    address = json['address'];
  }

  String? name;
  String? type;
  String? phoneNumber;
  num? balance;
  String? address;

  CustomerDto copyWith({
    String? name,
    String? type,
    String? phoneNumber,
    num? balance,
    String? address,
  }) =>
      CustomerDto(
        name: name ?? this.name,
        type: type ?? this.type,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        balance: balance ?? this.balance,
        address: address ?? this.address,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['type'] = type;
    map['phone_number'] = phoneNumber;
    map['balance'] = balance;
    map['address'] = address;
    return map;
  }

  CustomerEntity toEntity() => CustomerEntity(
        name: name,
        type: type,
        phoneNumber: phoneNumber,
        balance: balance,
        address: address,
      );
}
