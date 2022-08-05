import 'package:flutter/material.dart';
import 'package:mueble_app/models/categories_model.dart';
import 'package:mueble_app/models/mueble_model.dart';

class CategoryService extends ChangeNotifier {

  String _opcCategory = 'popular';

  List<Categories> data_category = [
  Categories(
    icon: Icons.star_rate_rounded, 
    category: 'popular'
    ),
  Categories(
    icon: Icons.chair_alt, 
    category: 'chair'
    ),
  Categories(
    icon: Icons.table_restaurant_rounded, 
    category: 'table'
    ),
  Categories(
    icon: Icons.chair_rounded, 
    category: 'sofa'
    ),
  Categories(
    icon: Icons.bed_outlined, 
    category: 'bed'
    ),

];

  Map<String,List<MuebleModelData>> categoryMuebles = {}; 


  CategoryService(){
    data_category.forEach((item) {
      categoryMuebles[item.category];
     });
    // getFurnitureByCategory(this._opcCategory);
  }

  String get opcCategoryGet{
    return _opcCategory;
  }

  set opcCategorySet(String category){
    _opcCategory = category;
    getFurnitureByCategory(category);
    notifyListeners();
  }

  getFurnitureByCategory(String category) async{
    final muebles = mueble_data;
    final dataMueble = muebles.where((item) => item.category == category);
    final mueble = dataMueble.map((item) => item.name).toList();
    print(mueble);
  }
  
}