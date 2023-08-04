import 'package:flutter/material.dart';
import 'package:screenshots/screens/welcome_screen.dart';

ScreenshotsApp main() => const ScreenshotsApp();

class ScreenshotsApp extends StatelessWidget {
  const ScreenshotsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Screenshots Demo',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const WelcomeScreen(),
    );
  }
}
