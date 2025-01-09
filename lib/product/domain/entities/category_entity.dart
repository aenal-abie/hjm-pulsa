enum Category {
  data("Data", crossAxisCount: 1),
  voice("Pulsa"),
  electricity("Pln"),
  game("Game", crossAxisCount: 1),
  wallet("Wallet");

  final String value;
  final int crossAxisCount;

  const Category(this.value, {this.crossAxisCount = 2});
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
