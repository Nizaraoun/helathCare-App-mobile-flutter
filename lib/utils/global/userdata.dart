import 'package:shared_preferences/shared_preferences.dart';

class UserData {
  static Future<String?> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }

  static Future<void> setToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('token', token);
  }

  static Future<String?> getuserdata(String data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(data);
  }
}
