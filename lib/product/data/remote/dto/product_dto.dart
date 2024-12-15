import 'package:pulsa/product/domain/entities/product_entity.dart';

class ProductDTO {
  ProductDTO({
    this.code,
    this.name,
    this.price,
    this.sellingPrice,
    this.groupId,
    this.id,
  });

  ProductDTO.fromJson(dynamic json) {
    id = json['id'];
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
  int? id;

  ProductDTO copyWith({
    String? code,
    String? name,
    int? id,
    int? price,
    int? sellingPrice,
    int? groupId,
  }) =>
      ProductDTO(
        id: id ?? this.id,
        code: code ?? this.code,
        name: name ?? this.name,
        price: price ?? this.price,
        sellingPrice: sellingPrice ?? this.sellingPrice,
        groupId: groupId ?? this.groupId,
      );

  ProductEntity toEntity() {
    return ProductEntity(
      id: id,
      name: name,
      code: code,
      groupId: groupId,
      price: price,
      sellingPrice: sellingPrice,
    );
  }
}
