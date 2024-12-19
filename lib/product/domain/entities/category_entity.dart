enum Category {
  data("Data"),
  voice("Pulsa"),
  electricity("Pln");

  final String value;

  const Category(this.value);
}

class CategoryEntity {
  CategoryEntity({
    this.id,
    this.name,
    this.code,
  });

  int? id;
  String? name;
  String? code;

  CategoryEntity copyWith({
    int? id,
    String? name,
    String? code,
  }) =>
      CategoryEntity(
        id: id ?? this.id,
        name: name ?? this.name,
        code: code ?? this.code,
      );
}
