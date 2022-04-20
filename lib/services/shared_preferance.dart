
import 'package:shared_preferences/shared_preferences.dart';
class SharedPreferanceClass{
  static String sharedPreferanceUserLogin="isLoggedIn";

  static Future<bool>saveUserLoggedInSharedPreference(bool isUserLoggedIn)async{
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    return await _prefs.setBool(sharedPreferanceUserLogin, isUserLoggedIn);
  }

  static Future<bool?>getUserLoggedInPreferance()async{
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    return await _prefs.getBool(sharedPreferanceUserLogin);
  }

}