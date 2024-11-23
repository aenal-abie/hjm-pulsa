import 'dart:io';

import 'package:firebase_remote_config/firebase_remote_config.dart';

import '../../../../config/config.dart';
import 'base/firebase_config_service.dart';

enum FirebaseParams {
  playStoreProdVersion("play_store_version"),
  appStoreProdVersion("app_store_version"),
  playStoreDevVersion("play_store_dev_version"),
  appStoreDevVersion("app_store_dev_version");

  final String param;

  const FirebaseParams(this.param);
}

class FirebaseConfigService extends IFirebaseConfigService {
  FirebaseConfigService();

  @override
  Future<String> getAppVersion() async {
    FirebaseRemoteConfig firebaseRemoteConfig = FirebaseRemoteConfig.instance;
    await firebaseRemoteConfig.setConfigSettings(RemoteConfigSettings(
        fetchTimeout: const Duration(seconds: 3),
        minimumFetchInterval: const Duration(seconds: 10)));
    await firebaseRemoteConfig.fetchAndActivate();
    var param = (Platform.isIOS)
        ? FirebaseParams.appStoreProdVersion.param
        : FirebaseParams.playStoreProdVersion.param;
    if (Constants.env == Environment.dev) {
      param = (Platform.isIOS)
          ? FirebaseParams.appStoreDevVersion.param
          : FirebaseParams.playStoreDevVersion.param;
    }
    return firebaseRemoteConfig.getString(param);
  }
}
