import 'package:pulsa/product/data/remote/dto/group_dto.dart';
import 'package:pulsa/product/domain/entities/product_entity.dart';

class ProductDTO {
  ProductDTO({
    this.code,
    this.name,
    this.price,
    this.sellingPrice,
    this.groupId,
    this.id,
    this.groupDto,
  });

  ProductDTO.fromJson(dynamic json) {
    id = json['id'];
    code = json['code'];
    name = json['name'];
    price = json['price'];
    sellingPrice = json['selling_price'];
    groupId = json['group_id'];
    groupDto = json['group'] != null ? GroupDto.fromJson(json['group']) : null;
  }

  String? code;
  String? name;
  int? price;
  int? sellingPrice;
  int? groupId;
  int? id;
  GroupDto? groupDto;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['code'] = code;
    map['name'] = name;
    map['price'] = price;
    map['selling_price'] = sellingPrice;
    map['group_id'] = groupId;
    return map;
  }

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
      groupEntity: groupDto?.toEntity(),
    );
  }
}
