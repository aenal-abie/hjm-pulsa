import 'package:pulsa/product/domain/entities/group_entity.dart';

class ProductEntity {
  String? code;
  String? name;
  int? price;
  int? sellingPrice;
  int? groupId;
  int? id;
  GroupEntity? groupEntity;

  ProductEntity({this.code,
    this.name,
    this.price,
    this.sellingPrice,
    this.groupId,
      this.groupEntity,
      this.id});
}
