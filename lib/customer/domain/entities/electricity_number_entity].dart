class ElectricityNumberEntity {
  ElectricityNumberEntity({
    this.message,
    this.status,
    this.rc,
    this.customerNo,
    this.meterNo,
    this.subscriberId,
    this.name,
    this.segmentPower,
  });

  String? message;
  String? status;
  String? rc;
  String? customerNo;
  String? meterNo;
  String? subscriberId;
  String? name;
  String? segmentPower;

  ElectricityNumberEntity copyWith({
    String? message,
    String? status,
    String? rc,
    String? customerNo,
    String? meterNo,
    String? subscriberId,
    String? name,
    String? segmentPower,
  }) =>
      ElectricityNumberEntity(
        message: message ?? this.message,
        status: status ?? this.status,
        rc: rc ?? this.rc,
        customerNo: customerNo ?? this.customerNo,
        meterNo: meterNo ?? this.meterNo,
        subscriberId: subscriberId ?? this.subscriberId,
        name: name ?? this.name,
        segmentPower: segmentPower ?? this.segmentPower,
      );
}
