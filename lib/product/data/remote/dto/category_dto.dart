import '../../../domain/entities/category_entity.dart';

class CategoryDto {
  CategoryDto({
    this.id,
    this.name,
    this.code,
  });

  CategoryDto.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    code = json['code'];
  }

  int? id;
  String? name;
  String? code;

  CategoryDto copyWith({
    int? id,
    String? name,
    String? code,
  }) =>
      CategoryDto(
        id: id ?? this.id,
        name: name ?? this.name,
        code: code ?? this.code,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['code'] = code;
    return map;
  }

  CategoryEntity toEntity() {
    return CategoryEntity(
      id: id,
      name: name,
      code: code,
    );
  }
}
