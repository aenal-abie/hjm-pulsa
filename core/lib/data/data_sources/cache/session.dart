import 'package:shared_preferences/shared_preferences.dart'
    show SharedPreferences;

class Session {
  static const String userId = "id";
  static const String username = "nama";
  static const String isSurveyor = "iniSurveyor";
  static const String photoUser = "userPhoto";
  static const String address = "alamat";
  static const String authToken = "auth_token";
  static const String screen = "screen";
  static const String codeScreen = "screen_code";

  Session._();

  static Future<bool> doRemove(String key) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();

    return await preferences.remove(key);
  }

  static Future<void> doSave(String key, dynamic value) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();

    switch (value.runtimeType) {
      case int:
        preferences.setInt(key, value);

        break;
      case double:
        preferences.setDouble(key, value);

        break;
      case bool:
        preferences.setBool(key, value);

        break;
      case String:
        preferences.setString(key, value);

        break;
      default:
        preferences.setStringList(key, value);
    }
  }

  static Future<dynamic> getValue(String key) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();

    return preferences.get(key);
  }

  static Future<bool> isExist(String key) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();

    return preferences.containsKey(key);
  }
}
