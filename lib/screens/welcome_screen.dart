import 'package:flutter/material.dart';
import 'package:screenshots/screens/products_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Welcome'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 200,
              padding: const EdgeInsets.only(bottom: 16),
              child: const FlutterLogo(size: 200),
            ),
            const Text(
              'Welcome to the Screenshots app!',
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        key: const Key('go_to_products_screen'),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute<void>(
              builder: (BuildContext context) => const ProductsScreen(),
            ),
          );
        },
        tooltip: 'Let\'s go',
        label: Text(
          'Let\'s go',
          style: Theme.of(context).textTheme.labelLarge,
        ),
      ),
    );
  }
}
