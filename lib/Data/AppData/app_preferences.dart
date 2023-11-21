import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  static SharedPreferences? _preferences;

  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  static Future setUserToken({required String? token}) async =>
      await _preferences?.setString("token", token ?? 'no_token');

  static String? getUserToken() => _preferences!.getString("token");

  static clearPref() {
    return _preferences?.clear();
  }

  static Future setUserName({required String? username}) async =>
      await _preferences?.setString("username", username ?? 'no_token');

  static String? getUsername() => _preferences!.getString("username");

  setLocale({required bool langLocale}) async {
    SharedPreferences myPrefs = await SharedPreferences.getInstance();
    await myPrefs.setBool('LangLocale', langLocale);
  }

  Future<bool?> getLocale() async {
    SharedPreferences myPrefs = await SharedPreferences.getInstance();

    return myPrefs.getBool('LangLocale') ?? true;
  }
}
