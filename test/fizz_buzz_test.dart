import 'package:test/test.dart';
import 'package:mockito/mockito.dart';

import 'package:hackerkegeln/fizz_buzz.dart';

main() {
  group('FuzzBuzz.convert', () {
    test('should return 1 if input is 1', () {
      var fizzBuzz = new FizzBuzz.standard();

      var result = fizzBuzz.convert(1);

      expect(result, equals('1'));
    });

    test('should check if rule applies', () {
      var rule1 = new RuleMock();
      var rule2 = new RuleMock();
      when(rule1.appliesTo(1)).thenReturn(false);
      when(rule2.appliesTo(1)).thenReturn(false);
      var fizzBuzz = new FizzBuzz([rule1, rule2]);

      fizzBuzz.convert(1);

      verify(rule1.appliesTo(1)).called(1);
      verify(rule2.appliesTo(1)).called(1);
    });

    test('should return original value result if no rule applies', () {
      var rule = new RuleMock();
      when(rule.appliesTo(42)).thenReturn(false);
      when(rule.result).thenReturn('Bla');
      var fizzBuzz = new FizzBuzz([rule]);

      var result = fizzBuzz.convert(42);

      expect(result, equals('42'));
    });

    test('should return converted result if rule applies', () {
      var rule = new RuleMock();
      when(rule.appliesTo(42)).thenReturn(true);
      when(rule.result).thenReturn('Bla');
      var fizzBuzz = new FizzBuzz([rule]);

      var result = fizzBuzz.convert(42);

      expect(result, equals('Bla'));
    });

    test('should return Fizz if input is divisible by 3', () {
      var fizzBuzz = new FizzBuzz.standard();

      var result = fizzBuzz.convert(3);

      expect(result, equals('Fizz'));
    });

    test('should return Buzz if input is divisible by 5', () {
      var fizzBuzz = new FizzBuzz.standard();

      var result = fizzBuzz.convert(5);

      expect(result, equals('Buzz'));
    });

    test('should return FizzBuzz if input is divisible by 15', () {
      var fizzBuzz = new FizzBuzz.standard();

      var result = fizzBuzz.convert(15);

      expect(result, equals('FizzBuzz'));
    });
  });
}

class RuleMock extends Mock implements Rule {}
