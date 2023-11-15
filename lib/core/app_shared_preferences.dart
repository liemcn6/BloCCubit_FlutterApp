part of 'core.dart';

class AppSP {
  static const loginInfo = 'login_info';
  static const accountInfo = 'accountInfo';
  static const selectedLocale = 'selected_locale';
  static const languageLocale = "language_locale";

  static set(key, value) {
    SharedPreferences pref = getIt<SharedPreferences>();
    if (value is String) {
      pref.setString(key, value);
    } else if (value is int) {
      pref.setInt(key, value);
    } else if (value is List<String>) {
      pref.setStringList(key, value);
    } else if (value is bool) {
      pref.setBool(key, value);
    } else if (value is double) {
      pref.setDouble(key, value);
    }
  }

  static get(key) {
    SharedPreferences pref = getIt<SharedPreferences>();
    if (pref.containsKey(key)) {
      return pref.get(key);
    }
  }

  static remove(key) {
    SharedPreferences pref = getIt<SharedPreferences>();
    pref.remove(key);
  }

  /// Store item
  static Future<void> storeItem(String key, dynamic value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, json.encode(value));
  }

  /// Delete item
  static Future<void> deleteItem(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }

  /// Retrieve item
  static Future<dynamic> retrieveItem(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var value = prefs.getString(key);
    if (value != null) {
      return jsonDecode(value);
    }
    return null;
  }

  /// Delete all
  static Future<void> deleteAll() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }
}
