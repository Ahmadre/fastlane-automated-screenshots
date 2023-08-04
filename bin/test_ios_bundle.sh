#!/usr/bin/env bash
set -e

pushd ios
xcodebuild test-without-building -xctestrun "../build/ios_e2e/Build/Products/Runner_iphoneos16.2-arm64.xctestrun" -destination id=12ED6CF1-6B13-47AC-8742-6DFEFFEE9E16
popd