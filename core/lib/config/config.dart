enum Environment { dev, staging, prod }

class Constants {
  static Map<String?, dynamic>? _config;

  static void setEnvironment(Environment env) {
    switch (env) {
      case Environment.dev:
        _config = _Config.debugConstants;
        break;
      case Environment.staging:
        _config = _Config.stagingConstants;
        break;
      case Environment.prod:
        _config = _Config.prodConstants;
        break;
    }
  }

  static get server {
    return _config?[_Config.server];
  }

  static get env {
    return _config?[_Config.env];
  }

  static get amplitudeKey {
    return _config?[_Config.amplitudeKey];
  }

  static get sentryKey {
    return _config?[_Config.sentryKey];
  }

  static get chatServer {
    return _config?[_Config.chatServer];
  }

  static get agoraApId {
    return _config?[_Config.agoraAppId];
  }
}

class _Config {
  static const server = "SERVER";
  static const env = "ENV";
  static const amplitudeKey = "AMPLITUDE_KEY";
  static const sentryKey = "SENTRY_KEY";
  static const chatServer = "CHAT_SERVER";
  static const agoraAppId = "AGORA_APP_ID";

  static Map<String, dynamic> debugConstants = {
    server: "http://127.0.0.1:8000/api/",
    amplitudeKey: "07f8afa312c255c5a953130c82f88f2d",
    sentryKey:
        'https://4f188d52999c477ebd0a63e0c0c13576@o1154705.ingest.sentry.io/62345351',
    env: Environment.dev,
    chatServer: "https://chatdev.getsurvey.id",
    agoraAppId: "467046265cbe4be8be97ed7ee832d4b8",
  };

  static Map<String, dynamic> stagingConstants = {
    server: "https://stg.getsurvey.id/",
    amplitudeKey: "07f8afa312c255c5a953130c82f88f2d",
    sentryKey:
        'https://4f188d52999c477ebd0a63e0c0c13576@o1154705.ingest.sentry.io/62345351',
    env: Environment.staging,
    chatServer: "https://chatstg.getsurvey.id",
    agoraAppId: "467046265cbe4be8be97ed7ee832d4b8",
  };

  static Map<String, dynamic> prodConstants = {
    server: "https://gateway.getsurvey.id/",
    amplitudeKey: "9c40fa10b70ebdf425ff56f978983fd7",
    sentryKey:
        'https://4f188d52999c477ebd0a63e0c0c13576@o1154705.ingest.sentry.io/6234535',
    env: Environment.prod,
    chatServer: "https://chat.getsurvey.id",
    agoraAppId: "467046265cbe4be8be97ed7ee832d4b8",
  };
}
