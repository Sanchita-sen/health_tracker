import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  static const _kUsername = 'username';
  static const _kEmail = 'email';

  static Future<void> saveUser(String username, {String? email}) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_kUsername, username);
    if (email != null) await prefs.setString(_kEmail, email);
  }

  static Future<Map<String, String?>> getUser() async {
    final prefs = await SharedPreferences.getInstance();
    final username = prefs.getString(_kUsername);
    final email = prefs.getString(_kEmail);
    return {'username': username, 'email': email};
  }

  static Future<void> clearUser() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_kUsername);
    await prefs.remove(_kEmail);
  }
}
