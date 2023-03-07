import 'package:flutter_test/flutter_test.dart';
import 'package:pricelocq_assessment/presentation/utils/validation_utils.dart';

void main() {
  group('Validation Utils', () {
    group('validateMobileNumber', () {
      //<Input String, Expected Result>
      const onEmpty = 'onEmpty';
      const onInvalid = 'onInvalid';
      final Map<String, String?> testCaseMap = {
        '': onEmpty,
        '1': onInvalid,
        'lorem ipsum': onInvalid,
        ' +12345678901 ': onInvalid,
        '012345678901': onInvalid,
        '+12345678901': onInvalid,
        '+123456789012': null,
        '12345678901': null,
      };
      for (var testInput in testCaseMap.keys) {
        final expected = testCaseMap[testInput];
        test('Input: $testInput > Expected: $expected', () {
          final actual = ValidationUtils.validateMobileNumber(
              value: testInput, onEmpty: onEmpty, onInvalid: onInvalid);

          expect(actual, equals(expected));
        });
      }
    });
    group('validatePassword', () {
      //<Input String, Expected Result>
      const onInvalid = 'onInvalid';
      final Map<String, String?> testCaseMap = {
        '': onInvalid,
        'password': null,
        'A8nMlqp!': null,
      };
      for (var testInput in testCaseMap.keys) {
        final expected = testCaseMap[testInput];
        test('Input: $testInput > Expected: $expected', () {
          final actual = ValidationUtils.validatePassword(
              value: testInput, onInvalid: onInvalid);

          expect(actual, equals(expected));
        });
      }
    });
  });
}
