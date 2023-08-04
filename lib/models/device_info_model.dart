import 'dart:convert';

/// deviceInfo: {
///  systemName: iOS,
///  isPhysicalDevice: false,
///  utsname: {
///    release: 22.5.0,
///    sysname: Darwin,
///    nodename: MacBook-Pro-7,
///    machine: iPhone15,3,
///    version: Darwin Kernel Version 22.5.0: Thu Jun  8 22:22:20 PDT 2023; root:xnu-8796.121.3~7/RELEASE_ARM64_T6000
///  },
///  model: iPhone,
///  localizedModel: iPhone,
///  systemVersion: 16.4,
///  name: iPhone 14 Pro Max,
///  identifierForVendor: 605B006B-3559-46AE-AFC8-225249F0BCDE
/// }
class DeviceInfoModel {
  final String systemName;
  final bool isPhysicalDevice;
  final String model;
  final String localizedModel;
  final String systemVersion;
  final String name;
  final String identifierForVendor;

  const DeviceInfoModel({
    required this.systemName,
    required this.isPhysicalDevice,
    required this.model,
    required this.localizedModel,
    required this.systemVersion,
    required this.name,
    required this.identifierForVendor,
  });

  DeviceInfoModel copyWith({
    String? systemName,
    bool? isPhysicalDevice,
    String? model,
    String? localizedModel,
    String? systemVersion,
    String? name,
    String? identifierForVendor,
  }) {
    return DeviceInfoModel(
      systemName: systemName ?? this.systemName,
      isPhysicalDevice: isPhysicalDevice ?? this.isPhysicalDevice,
      model: model ?? this.model,
      localizedModel: localizedModel ?? this.localizedModel,
      systemVersion: systemVersion ?? this.systemVersion,
      name: name ?? this.name,
      identifierForVendor: identifierForVendor ?? this.identifierForVendor,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'systemName': systemName,
      'isPhysicalDevice': isPhysicalDevice,
      'model': model,
      'localizedModel': localizedModel,
      'systemVersion': systemVersion,
      'name': name,
      'identifierForVendor': identifierForVendor,
    };
  }

  factory DeviceInfoModel.fromMap(Map<String, dynamic> map) {
    return DeviceInfoModel(
      systemName: map['systemName'] ?? '',
      isPhysicalDevice: map['isPhysicalDevice'] is String
          ? (bool.tryParse(map['isPhysicalDevice']) ?? false)
          : map['isPhysicalDevice'] ?? false,
      model: map['model'] ?? '',
      localizedModel: map['localizedModel'] ?? '',
      systemVersion: map['systemVersion'] ?? '',
      name: map['name'] ?? '',
      identifierForVendor: map['identifierForVendor'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory DeviceInfoModel.fromJson(String source) =>
      DeviceInfoModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'DeviceInfoModel(systemName: $systemName, isPhysicalDevice: $isPhysicalDevice, model: $model, localizedModel: $localizedModel, systemVersion: $systemVersion, name: $name, identifierForVendor: $identifierForVendor)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is DeviceInfoModel &&
        other.systemName == systemName &&
        other.isPhysicalDevice == isPhysicalDevice &&
        other.model == model &&
        other.localizedModel == localizedModel &&
        other.systemVersion == systemVersion &&
        other.name == name &&
        other.identifierForVendor == identifierForVendor;
  }

  @override
  int get hashCode {
    return systemName.hashCode ^
        isPhysicalDevice.hashCode ^
        model.hashCode ^
        localizedModel.hashCode ^
        systemVersion.hashCode ^
        name.hashCode ^
        identifierForVendor.hashCode;
  }
}
