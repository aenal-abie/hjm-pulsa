import 'package:core/domain/error/failures.dart';
import 'package:core/utils/convert.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('convertToDouble', () {
    test('returns 0.0 when given null', () {
      expect(convertToDouble(null), equals(0.0));
    });

    test('returns the same double value when given a double', () {
      expect(convertToDouble(3.14), equals(3.14));
    });

    test('returns the parsed double value when given a string', () {
      expect(convertToDouble('3.14'), equals(3.14));
    });

    test('returns the double equivalent of an integer value', () {
      expect(convertToDouble(42), equals(42.0));
    });

    test('throws an InvalidParam exception when given an unsupported value',
        () {
      expect(() => convertToDouble(true),
          throwsA(const TypeMatcher<InvalidParam>()));
    });
  });
}
