class Customer {
  Customer({
    this.id,
    this.userId,
    this.type,
    this.address,
    this.phoneNumber,
    this.createdAt,
    this.updatedAt,
  });

  Customer.fromJson(dynamic json) {
    id = json['id'];
    userId = json['user_id'];
    type = json['type'];
    address = json['address'];
    phoneNumber = json['phone_number'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  int? id;
  int? userId;
  String? type;
  String? address;
  String? phoneNumber;
  String? createdAt;
  String? updatedAt;
  Customer copyWith({
    int? id,
    int? userId,
    String? type,
    String? address,
    String? phoneNumber,
    String? createdAt,
    String? updatedAt,
  }) =>
      Customer(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        type: type ?? this.type,
        address: address ?? this.address,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['user_id'] = userId;
    map['type'] = type;
    map['address'] = address;
    map['phone_number'] = phoneNumber;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }
}
