import 'package:device_info_plus/device_info_plus.dart';

class DeviceInfo {
  // Create Singleton
  static final DeviceInfo instance = DeviceInfo._internal();

  factory DeviceInfo() => instance;

  DeviceInfo._internal();

  Future<void> init() async {
    await getDeviceInfo();
  }

  late DeviceInfoPlugin deviceInfo;

  Future<void> getDeviceInfo() async {
    deviceInfo = DeviceInfoPlugin();
  }
}
