import 'package:pulsa/buys/domain/entities/product_entity.dart';

class ProductDTO {
  ProductDTO({
    this.code,
    this.name,
    this.price,
    this.sellingPrice,
    this.groupId,
  });

  ProductDTO.fromJson(dynamic json) {
    code = json['code'];
    name = json['name'];
    price = json['price'];
    sellingPrice = json['selling_price'];
    groupId = json['group_id'];
  }
  String? code;
  String? name;
  int? price;
  int? sellingPrice;
  int? groupId;
  ProductDTO copyWith({
    String? code,
    String? name,
    int? price,
    int? sellingPrice,
    int? groupId,
  }) =>
      ProductDTO(
        code: code ?? this.code,
        name: name ?? this.name,
        price: price ?? this.price,
        sellingPrice: sellingPrice ?? this.sellingPrice,
        groupId: groupId ?? this.groupId,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = code;
    map['name'] = name;
    map['price'] = price;
    map['selling_price'] = sellingPrice;
    map['group_id'] = groupId;
    return map;
  }

  ProductEntity toEntity() {
    return ProductEntity(
      name: name,
      code: code,
      groupId: groupId,
      price: price,
      sellingPrice: sellingPrice,
    );
  }
}
