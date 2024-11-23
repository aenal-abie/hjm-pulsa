import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:permission_handler/permission_handler.dart';

Future<bool> permissionIsGranted(Permission permission) async =>
    await permission.request().isGranted;

class GSPermission {
  static const notification = Permission.notification;
}

Future<bool> requestStoragePermission() async {
  if (Platform.isAndroid) {
    final androidInfo = await DeviceInfoPlugin().androidInfo;
    if (androidInfo.version.sdkInt <= 32) {
      return await permissionIsGranted(Permission.storage);
    }
    return true;
  } else if (Platform.isIOS) {
    return true;
  }
  return false;
}
