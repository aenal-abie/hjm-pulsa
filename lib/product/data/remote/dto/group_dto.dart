import 'package:pulsa/product/data/remote/dto/category_dto.dart';

import '../../../domain/entities/group_entity.dart';

class GroupDto {
  GroupDto({
    this.id,
    this.code,
    this.name,
    this.category,
  });

  GroupDto.fromJson(dynamic json) {
    id = json['id'];
    code = json['code'];
    name = json['name'];
    category = json['category'] != null
        ? CategoryDto.fromJson(json['category'])
        : null;
  }

  int? id;
  String? code;
  String? name;
  CategoryDto? category;

  GroupDto copyWith({
    int? id,
    String? code,
    String? name,
  }) =>
      GroupDto(
        id: id ?? this.id,
        code: code ?? this.code,
        name: name ?? this.name,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['code'] = code;
    map['name'] = name;
    return map;
  }

  GroupEntity toEntity() {
    return GroupEntity(
      id: id,
      code: code,
      name: name,
      category: category?.toEntity(),
    );
  }
}
