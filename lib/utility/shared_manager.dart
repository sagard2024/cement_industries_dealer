import 'package:encrypt_shared_preferences/provider.dart';

class SharedManager {
  static late EncryptedSharedPreferences sharedPref;

  static init() async {
    const key = '0102030405060708';
    await EncryptedSharedPreferences.initialize(key);
    sharedPref = EncryptedSharedPreferences.getInstance();
  }

  static String getStringPreference(String key, {String? defaultValue}) {
    return sharedPref.getString(key, defaultValue: (defaultValue ?? '')) ?? (defaultValue ?? '');
  }

  static Future<bool> setStringPreference(String key, String value) async {
    return setStringPref(key, value);
  }

  static Future<bool> setStringPref(String key, String value) async {
    return sharedPref.setString(key, value);
  }

  static List<String> getStringListPreference(String key, {List<String>? defaultValue}) {
    return sharedPref.getStringList(key) ?? [];
  }

  static Future<bool> setStringListPreference(String key, List<String> value) async {
    return setStringListPref(key, value);
  }

  static Future<bool> setStringListPref(String key, List<String> value) async {
    return sharedPref.setStringList(key, value);
  }

  static int? getIntegerPreference(String key) {
    return sharedPref.getInt(key);
  }

  static Future<bool> setIntegerPreference(String key, int? value) async {
    return setIntegerPref(key, value);
  }

  static Future<bool> setIntegerPref(String key, int? value) async {
    return sharedPref.setInt(key, value);
  }

  static Future<bool> setBooleanPreference(String key, bool value) async {
    return setBooleanPref(key, value);
  }

  static Future<bool> setBooleanPref(String key, bool value) async {
    return sharedPref.setBoolean(key, value);
  }

  static bool getBooleanPreference(String key) {
    return sharedPref.getBoolean(key) ?? false;
  }

  static Future<bool> clearSharedPreference() async {
    return sharedPref.clear();
  }
}
