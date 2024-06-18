import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  static const String _userTokenKey = 'USER_TOKEN';
  static const String _userNameKey = "USER_NAME";
  final SharedPreferences _prefs;

  SharedPreferencesHelper({required SharedPreferences prefs}) : _prefs = prefs;

  Future<void> saveUserToken(String token) async {
    await _prefs.setString(_userTokenKey, token);
  }

  Future<void> saveUserName(String name) async {
    await _prefs.setString(_userNameKey, name);
  }

  Future<String?> getUserToken() async {
    return _prefs.getString(_userTokenKey);
  }

  Future<String?> getUserName() async {
    return _prefs.getString(_userNameKey);
  }

  Future<void> clearUserToken() async {
    await _prefs.remove(_userTokenKey);
  }

  Future<void> clearUserName() async {
    await _prefs.remove(_userNameKey);
  }
}
