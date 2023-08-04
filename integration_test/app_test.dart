// import 'dart:io' show File;

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:screenshots/extensions/string_extensions.dart';
import 'package:screenshots/main_test.dart' as app;
import 'package:screenshots/models/device_info.dart';
import 'package:screenshots/models/device_info_model.dart';
import 'package:screenshots/screens/product_detail_screen.dart';
import 'package:screenshots/screens/products_screen.dart';
import 'package:screenshots/screens/profile_screen.dart';
import 'package:screenshots/screens/welcome_screen.dart';

void main() async {
  late String screenshotsPath;
  final IntegrationTestWidgetsFlutterBinding binding =
      // ignore: unnecessary_cast
      IntegrationTestWidgetsFlutterBinding.ensureInitialized()
          as IntegrationTestWidgetsFlutterBinding;

  binding.framePolicy = LiveTestWidgetsFlutterBindingFramePolicy.fullyLive;

  setUpAll(() async {
    await DeviceInfo.instance.init();
    final DeviceInfoModel deviceInfo = DeviceInfoModel.fromMap(
        (await DeviceInfo.instance.deviceInfo.deviceInfo).data);

    const basePath = 'integration_test/screenshots';

    final systemName = deviceInfo.systemName.toLowerCase().isNotNullOrBlank ? deviceInfo.systemName.toLowerCase() : 'android';
    final systemPath = '$basePath/$systemName';
    final deviceName = deviceInfo.name.trim().replaceAll(' ', '');
    screenshotsPath = '$systemPath/$deviceName';
  });

  tearDownAll(() {});

  /// Test if welcome screen is shown
  testWidgets('--- Screenshots Tests ---', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(app.main());
    await Future.delayed(const Duration(seconds: 2));

    // On Android, this is required prior to taking the screenshot.
    await binding.convertFlutterSurfaceToImage();

    // Verify that welcome screen is shown
    expect(find.byType(WelcomeScreen), findsOneWidget);

    // Capture screenshot
    await tester.pumpAndSettle();
    await binding.takeScreenshot('$screenshotsPath/01_welcome_screen.png');

    // tap on floating action button to forward to next page
    await tester.tap(find.byKey(const Key('go_to_products_screen')));
    await tester.pumpAndSettle();

    await Future.delayed(const Duration(seconds: 2));

    // Verify that products screen is shown
    expect(find.byType(ProductsScreen), findsOneWidget);

    // Capture screenshot
    await binding.takeScreenshot('$screenshotsPath/02_products_screen.png');

    // tap on a product to forward to next page
    await tester.tap(find.byKey(const Key('product_0')));
    await tester.pumpAndSettle();

    await Future.delayed(const Duration(seconds: 1));

    // Verify that product detail screen is shown
    expect(find.byType(ProductDetailScreen), findsOneWidget);

    // Capture screenshot
    await binding
        .takeScreenshot('$screenshotsPath/03_product_detail_screen.png');

    // Tap on floating action button to go to Profile screen
    await tester.tap(find.byKey(const Key('go_to_profile_screen')));
    await tester.pumpAndSettle();

    await Future.delayed(const Duration(seconds: 1));

    // Verify that profile screen is shown
    expect(find.byType(ProfileScreen), findsOneWidget);

    // Capture screenshot
    await binding.takeScreenshot('$screenshotsPath/04_profile_screen.png');
  });
}
