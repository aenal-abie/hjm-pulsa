import 'package:flutter/services.dart';
import 'package:package_info_plus/package_info_plus.dart';

Future<String?> getLocalVersion() async {
  String? version;
  try {
    final PackageInfo packageInfo = await PackageInfo.fromPlatform();
    return packageInfo.version;
  } on PlatformException {
    version = null;
  }
  return version;
}
