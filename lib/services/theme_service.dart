import 'package:flutter/material.dart';

class ThemeService extends ChangeNotifier {

  ThemeData currentTheme;

  ThemeService({
    required bool isDarkMode
  }):currentTheme = isDarkMode ? ThemeData.dark() : ThemeData.light();

  setLightMode(){
    currentTheme = ThemeData.light();
    notifyListeners();
  }
  setDarkMode(){
    currentTheme = ThemeData.dark();
    notifyListeners();
  }

  
}