import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Preferences {

  static late SharedPreferences _prefs;
  static bool _isDarkMode = false;
  static int _isSelectCategory = 1;

  static int _optMenu = 0;

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

/// This is a getter and setter for the optMenu variable.
   int get optMenuGet{
    return _prefs.getInt('optMenu') ?? _optMenu;
  }
   set optMenuSet(int value){
    _optMenu = value;
    _prefs.setInt('optMenu', value);
    
  }

  
}