import 'package:pulsa/customer/domain/entities/balance_entity.dart';

class BalanceDto {
  BalanceDto({
    this.balance,
  });

  BalanceDto.fromJson(dynamic json) {
    balance = json['balance'];
  }

  num? balance;

  BalanceDto copyWith({
    int? balance,
  }) =>
      BalanceDto(
        balance: balance ?? this.balance,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['balance'] = balance;
    return map;
  }

  BalanceEntity toEntity() {
    return BalanceEntity(
      balance: balance,
    );
  }
}
