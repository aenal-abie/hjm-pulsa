class BalanceEntity {
  BalanceEntity({
    this.balance,
  });

  num? balance;

  BalanceEntity copyWith({
    int? balance,
  }) =>
      BalanceEntity(
        balance: balance ?? this.balance,
      );
}
