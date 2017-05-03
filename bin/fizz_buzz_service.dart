import 'dart:isolate';
import 'package:hackerkegeln/fizz_buzz.dart';

void main(List<String> args, SendPort replyTo) {
  print('service called with $args');
  var fizzbuzz = new FizzBuzz.standard();
  replyTo.send(fizzbuzz.convert(int.parse(args[0])));
}