import 'package:all_in_one_student/constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SaveService {
  static Future<void> retrieveUser() async {
    final prefs = await SharedPreferences.getInstance();
    // Check where the Ip is saved before or not
    if (!prefs.containsKey('code') && !prefs.containsKey('pass')) {
      return;
    }

    code = prefs.getString('code')!;
    pass = prefs.getString('pass')!;
  }

  static Future<void> saveUser() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('code', code);
    prefs.setString('pass', pass);
  }

  static Future<void> clearUser() async {
    final prefs = await SharedPreferences.getInstance();
    code = "";
    pass = "";
    prefs.setString('code', "");
    prefs.setString('pass', "");
  }
}
