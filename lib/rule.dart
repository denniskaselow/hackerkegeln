

abstract class Rule {
  bool appliesTo(int number);
  String get result;
}

class FizzRule implements Rule {

  @override
  bool appliesTo(int number) {
    return number % 3 == 0;
  }
  @override
  String get result {
    return 'Fizz';
  }
}

class BuzzRule implements Rule {

  @override
  bool appliesTo(int number) {
    return number % 5 == 0;
  }
  @override
  String get result {
    return 'Buzz';
  }
}

class FizzBuzzRule implements Rule {

  @override
  bool appliesTo(int number) {
    return number % 15 == 0;
  }
  @override
  String get result {
    return 'FizzBuzz';
  }
}