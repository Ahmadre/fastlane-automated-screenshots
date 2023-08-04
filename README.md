## Getting Started

Make sure you have flutter installed on your machine. If not, follow the instructions [here](https://flutter.dev/docs/get-started/install).

## Start the screenshot tests

```
flutter drive \                      
  --driver=test_driver/integration_test.dart \
  --target=integration_test/app_test.dart
```

> If you are beeing asked to select a device please follow the instructions in the CLI.

## Frame your screenshots

To create final versions for the App Stores with frames, run the following command (in ios folder):

```
fastlane frame_screenshots
```

> Note: This is just a Prototype tested with IPhone 13 Pro Max and IPhone 14 Pro Max. Android is also working, but the fastlane lane is not yet configured!