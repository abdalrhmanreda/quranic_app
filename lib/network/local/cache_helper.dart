import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static SharedPreferences? sharedPreferences;
  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool>? saveData({
    required String key,
    required dynamic value,
  }) {
    if (value is bool) return sharedPreferences!.setBool(key, value);
    if (value is String) return sharedPreferences!.setString(key, value);
    if (value is int) return sharedPreferences!.setInt(key, value);
    return sharedPreferences!.setDouble(key, value);
  }

  static Object? getData({required String key}) {
    return sharedPreferences!.get(key);
  }
}
