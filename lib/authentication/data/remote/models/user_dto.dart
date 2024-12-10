class UserDto {
  UserDto({
    this.id,
    this.name,
    this.email,
    this.token,
  });

  UserDto.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    token = json['token'];
  }
  int? id;
  String? name;
  String? email;
  String? token;
  UserDto copyWith({
    int? id,
    String? name,
    String? email,
    String? token,
  }) =>
      UserDto(
        id: id ?? this.id,
        name: name ?? this.name,
        email: email ?? this.email,
        token: token ?? this.token,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['email'] = email;
    map['token'] = token;
    return map;
  }
}
