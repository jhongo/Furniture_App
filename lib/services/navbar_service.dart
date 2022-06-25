import 'package:flutter/material.dart';


class NavBarService extends ChangeNotifier {

  int _opcIndex = 0;
  final PageController _pageController = PageController();

  int get opcIndexGet{
    return _opcIndex;
  }

  PageController get pageControllerGet{
    return _pageController;
  }
  
  set opcIndexSet(int opc ){
    _opcIndex = opc;
    _pageController.animateToPage(opc, duration: Duration(milliseconds: 250), curve: Curves.easeIn);
    notifyListeners();
  }


  
}