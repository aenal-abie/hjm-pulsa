import 'package:amplitude_flutter/amplitude.dart';

import '../config/config.dart';

class AmplitudeAnalytic {
  var analytics = Amplitude.getInstance();

  AmplitudeAnalytic._() {
    analytics.init(Constants.amplitudeKey);
  }

  Future<void> event(String eventName, Map<String, dynamic>? params) async {
    analytics.logEvent(eventName, eventProperties: params);
  }
}

class AmplitudeAnalyticHelper {
  static Future<void> addEventLog(String eventName,
      {Map<String, dynamic>? params}) async {
    AmplitudeAnalytic amplitudeAnalytic = AmplitudeAnalytic._();
    amplitudeAnalytic.event(eventName, params);
  }
}
