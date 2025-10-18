// test/validators_test.dart
import 'package:flutter_test/flutter_test.dart';
import 'package:testing/core/utils/validators.dart';
void main() {
  group('Email validation', () {
    test('valid email returns null', () {
      expect(Validators.validateEmail('test@example.com'), isNull);
    });

    test('missing @ returns error', () {
      expect(Validators.validateEmail('testexample.com'), isNotNull);
    });

    test('invalid domain returns error', () {
      expect(Validators.validateEmail('a@b'), isNotNull);
    });

    test('empty email returns error', () {
      expect(Validators.validateEmail(''), isNotNull);
      expect(Validators.validateEmail(null), isNotNull);
    });
  });

  group('Password validation', () {
    test('strong password returns null', () {
      expect(Validators.validatePassword('Abcd1234!'), isNull);
    });

    test('short password returns error', () {
      expect(Validators.validatePassword('A1!a'), isNotNull);
    });

    test('no number returns error', () {
      expect(Validators.validatePassword('Abcdefgh!'), isNotNull);
    });

    test('no uppercase returns error', () {
      expect(Validators.validatePassword('abcd1234!'), isNotNull);
    });

    test('no special char returns error', () {
      expect(Validators.validatePassword('Abcd12345'), isNotNull);
    });
  });

  group('Confirm password', () {
    test('matching passwords returns null', () {
      expect(Validators.validateConfirmPassword('pass', 'pass'), isNull);
    });

    test('non-matching returns error', () {
      expect(Validators.validateConfirmPassword('pass1', 'pass2'), isNotNull);
});
});
}