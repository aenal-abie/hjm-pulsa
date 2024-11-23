import 'package:core/domain/error/failures.dart';

double convertToDouble(dynamic value) {
  try {
    if (value == null) return 0.0;
    if (value is double) {
      return value;
    } else if (value is String) {
      var validateDouble = value.replaceAll(",", ".");
      return double.parse(validateDouble);
    } else if (value is int) {
      return value.toDouble();
    } else {
      throw const InvalidParam(message: "Value cannot be converted to double");
    }
  } on Exception {
    return 0.0;
  }
}
