import 'package:flutter/material.dart';

class CategoryService extends ChangeNotifier {

  String _opcCategory = 'popular';

  String get opcCategoryGet{
    return _opcCategory;
  }

  set opcCategorySet(String opc){
    _opcCategory = opc;
    notifyListeners();
  }
  
}