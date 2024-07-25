import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';

class DeviceInfo {
  late String deviceName;
  late String deviceOS;
  late String deviceId;
  Future<String> getDeviceInfo(BuildContext context) async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    if (Theme.of(context).platform == TargetPlatform.android) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      deviceName = '${androidInfo.brand} ${androidInfo.model}';
      deviceOS = 'Android';
      deviceId = androidInfo.id;
    } else {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      deviceName = '${iosInfo.systemVersion} ${iosInfo.name}';
      deviceOS = 'iPhone';
    }
    print("deviceName:-$deviceName,$deviceOS");
    return '$deviceOS ($deviceName)';
  }

  Future<String> getDeviceUnique(BuildContext context) async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    if (Theme.of(context).platform == TargetPlatform.android) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      deviceId = androidInfo.id;
    } else {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      deviceId = 'f88';
    }
    print("deviceId:-$deviceId");
    return deviceId;
  }
}
