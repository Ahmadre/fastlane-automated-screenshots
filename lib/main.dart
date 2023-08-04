import 'package:flutter/material.dart';
import 'package:screenshots/screens/welcome_screen.dart';

void main() {
  runApp(const ScreenshotsApp());
}

class ScreenshotsApp extends StatelessWidget {
  const ScreenshotsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Screenshots Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const WelcomeScreen(),
    );
  }
}
