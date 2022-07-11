import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MenuOpcPreferences extends ChangeNotifier {

  late SharedPreferences _prefs;

  int _optMenu = 0;
  final PageController _pageController = PageController();

  Future optionsMenuGet() async{
     _prefs = await SharedPreferences.getInstance();
     await _prefs.setInt('optMenu', optMenuGet);
  }
  Future optionsMenuSet() async{
     _prefs = await SharedPreferences.getInstance();
     await _prefs.getInt('optMenu');
  }

  int get optMenuGet{
    return _optMenu;
  }
  set optMenuSet(int option){
    _optMenu = option;
    
    _pageController.animateToPage(option, duration: Duration(milliseconds: 250), curve: Curves.easeIn);
    print(option);
    notifyListeners();
  }

  PageController get pageControllerGet{
    return  _pageController;
  }
  
}