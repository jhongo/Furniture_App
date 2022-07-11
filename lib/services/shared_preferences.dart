import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Preferences {

  static late SharedPreferences _prefs;
  static bool _isDarkMode = false;


/// `init()` is a function that returns a Future
  static Future init() async{
    _prefs = await SharedPreferences.getInstance();
  }

/// This is a getter and setter for the isDarkMode variable.
  static bool get isDarkModeGet{
    return _prefs.getBool('isDarkMode') ?? _isDarkMode;
  }
  static set isDarkModeSet(bool value){
    _isDarkMode = value;
    _prefs.setBool('isDarkMode', value);
  }


  
}