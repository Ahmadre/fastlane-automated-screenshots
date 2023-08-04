import 'package:flutter_test/flutter_test.dart';

Future<bool> waitFor(
  WidgetTester tester,
  Finder finder, {
  int retries = 10,
  Duration duration = const Duration(seconds: 1),
  bool throwError = true,
}) async {
  int counter = 0;
  while (!findsOneWidget.matches(finder, {})) {
    await tester.pump(duration);
    counter++;
    if (counter >= retries) {
      if (throwError) {
        throw 'Error: Cannot find ${finder.toString()}';
      }
      return false;
    }
  }
  return true;
}

Future<void> addDelay(int seconds) async {
  await Future<void>.delayed(Duration(seconds: seconds));
}