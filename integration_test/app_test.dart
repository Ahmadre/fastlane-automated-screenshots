import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:screenshots/main_test.dart' as app;
import 'package:screenshots/screens/product_detail_screen.dart';
import 'package:screenshots/screens/products_screen.dart';
import 'package:screenshots/screens/profile_screen.dart';
import 'package:screenshots/screens/welcome_screen.dart';

void main() async {
  final IntegrationTestWidgetsFlutterBinding binding =
      // ignore: unnecessary_cast
      IntegrationTestWidgetsFlutterBinding.ensureInitialized()
          as IntegrationTestWidgetsFlutterBinding;

  binding.framePolicy = LiveTestWidgetsFlutterBindingFramePolicy.fullyLive;

  setUpAll(() {});

  tearDownAll(() {});

  /// Test if welcome screen is shown
  testWidgets('--- Screenshots Tests ---', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(app.main());
    await Future.delayed(const Duration(seconds: 2));

    // Verify that welcome screen is shown
    expect(find.byType(WelcomeScreen), findsOneWidget);

    // tap on floating action button to forward to next page
    await tester.tap(find.byKey(const Key('go_to_products_screen')));
    await tester.pumpAndSettle();

    // Verify that products screen is shown
    expect(find.byType(ProductsScreen), findsOneWidget);

    // tap on a product to forward to next page
    await tester.tap(find.byKey(const Key('product_0')));
    await tester.pumpAndSettle();

    // Verify that product detail screen is shown
    expect(find.byType(ProductDetailScreen), findsOneWidget);

    // Tap on floating action button to go to Profile screen
    await tester.tap(find.byKey(const Key('go_to_profile_screen')));
    await tester.pumpAndSettle();

    // Verify that profile screen is shown
    expect(find.byType(ProfileScreen), findsOneWidget);    
  });
}
