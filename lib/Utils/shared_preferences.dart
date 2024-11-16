
import 'package:shared_preferences/shared_preferences.dart';

class Cache {
  static Future<void> SetString(String key, String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }

  static Future<String> GetString(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      return (prefs.getString(key)) as String;
    } catch (E) {
      return "";
    }
  }

  static Future<void> RemoveCache() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove("id");
  }
}
