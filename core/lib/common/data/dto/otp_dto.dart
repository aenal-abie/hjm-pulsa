import '../../domain/entities/otp_entity.dart';

class OtpDto extends OtpEntity {
  OtpDto();

  OtpDto.fromJson(dynamic json) {
    super.message = json['message'];
    super.intervalTimeRequest = json['interval_time'] ??
        DateTime.now().add(const Duration(minutes: 2)).millisecondsSinceEpoch;
  }
}
