import 'package:hackerkegeln/rule.dart';
export 'package:hackerkegeln/rule.dart';

class FizzBuzz {
  List<Rule> _rules;
  FizzBuzz(List<Rule> rules) {
    this._rules = rules;
  }

  FizzBuzz.standard()
      : this([new FizzBuzzRule(), new FizzRule(), new BuzzRule()]);

  String convert(int number) {
    for (Rule rule in _rules) {
      if (rule.appliesTo(number)) return rule.result;
    }
    return '$number';
  }
}
