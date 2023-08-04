#!/usr/bin/env bash
set -e

rm -rf build/ios_e2e

flutter build ios --config-only integration_test/app_test.dart

flutter build ios integration_test/app_test.dart --release --no-codesign

pushd ios
xcodebuild -workspace Runner.xcworkspace -scheme Runner -config Flutter/internalRelease.xcconfig -derivedDataPath ../build/ios_e2e -sdk iphoneos build-for-testing
popd

pushd build/ios_e2e/Build/Products
zip -r "ios_tests.zip" "Release-iphoneos" "Runner_iphoneos16.2-arm64.xctestrun"
popd

./bin/test_ios_bundle.sh