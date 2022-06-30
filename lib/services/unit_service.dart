import 'package:flutter/material.dart';


class UnitService extends ChangeNotifier {

  int _unit = 0;
  bool _isActive = false;

/// A getter and setter.
  int get unitGet => _unit;
  set unitSet(int value){
    _unit = value;
    notifyListeners();
  }

/// A getter and setter.
  bool get isActiveGet => _isActive;
  set isActiveSet(bool value){
    _isActive = value;
    notifyListeners();
  }
  
}