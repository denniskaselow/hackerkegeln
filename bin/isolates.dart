import 'dart:isolate';

main() async {
  for (int i = 0; i < 100; i++) {
    var response = new ReceivePort();
    Isolate
        .spawnUri(
            Uri.parse('fizz_buzz_service.dart'), ['$i'], response.sendPort)
        .then((_) => response.first)
        .then((msg) => print('$i = $msg'));
  }
}
