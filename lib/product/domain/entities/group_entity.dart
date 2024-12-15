import 'package:pulsa/product/domain/entities/category_entity.dart';

class GroupEntity {
  GroupEntity({
    this.id,
    this.code,
    this.name,
    this.category,
  });

  int? id;
  String? code;
  String? name;
  CategoryEntity? category;

  GroupEntity copyWith({
    int? id,
    String? code,
    String? name,
  }) =>
      GroupEntity(
        id: id ?? this.id,
        code: code ?? this.code,
        name: name ?? this.name,
      );
}
