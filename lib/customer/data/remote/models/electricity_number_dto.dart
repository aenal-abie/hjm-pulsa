import 'package:pulsa/customer/domain/entities/electricity_number_entity%5D.dart';

class ElectricityNumberDto {
  ElectricityNumberDto({
    this.message,
    this.status,
    this.rc,
    this.customerNo,
    this.meterNo,
    this.subscriberId,
    this.name,
    this.segmentPower,
  });

  ElectricityNumberDto.fromJson(dynamic json) {
    message = json['message'];
    status = json['status'];
    rc = json['rc'];
    customerNo = json['customer_no'];
    meterNo = json['meter_no'];
    subscriberId = json['subscriber_id'];
    name = json['name'];
    segmentPower = json['segment_power'];
  }

  String? message;
  String? status;
  String? rc;
  String? customerNo;
  String? meterNo;
  String? subscriberId;
  String? name;
  String? segmentPower;

  ElectricityNumberDto copyWith({
    String? message,
    String? status,
    String? rc,
    String? customerNo,
    String? meterNo,
    String? subscriberId,
    String? name,
    String? segmentPower,
  }) =>
      ElectricityNumberDto(
        message: message ?? this.message,
        status: status ?? this.status,
        rc: rc ?? this.rc,
        customerNo: customerNo ?? this.customerNo,
        meterNo: meterNo ?? this.meterNo,
        subscriberId: subscriberId ?? this.subscriberId,
        name: name ?? this.name,
        segmentPower: segmentPower ?? this.segmentPower,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['status'] = status;
    map['rc'] = rc;
    map['customer_no'] = customerNo;
    map['meter_no'] = meterNo;
    map['subscriber_id'] = subscriberId;
    map['name'] = name;
    map['segment_power'] = segmentPower;
    return map;
  }

  ElectricityNumberEntity toEntity() {
    return ElectricityNumberEntity(
      message: message,
      status: status,
      rc: rc,
      customerNo: customerNo,
      meterNo: meterNo,
      subscriberId: subscriberId,
      name: name,
      segmentPower: segmentPower,
    );
  }
}
