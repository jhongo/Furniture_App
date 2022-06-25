import 'package:flutter/material.dart';


class UnitService extends ChangeNotifier {

  int _unit = 0;
  bool _isActive = false;

  int get unitGet => _unit;
  set unitSet(int value){
    _unit = value;
    notifyListeners();
  }

  bool get isActiveGet => _isActive;
  set isActiveSet(bool value){
    _isActive = value;
    notifyListeners();
  }
  
}