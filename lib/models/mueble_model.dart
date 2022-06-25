import 'package:flutter/cupertino.dart';
import 'package:mueble_app/services/unit_service.dart';
import 'package:provider/provider.dart';

class MuebleModelData{ 
  final String name;
  final double price;
  final List<String> img;
  final double qualification;
  final int unit;
  final String description;
  final String category;
  final List<int> colors;

  MuebleModelData({
  required this.name, 
  required this.price,
  required this.img, 
  required this.qualification, 
  required this.unit, 
  required this.description,
  required this.category,
  required this.colors
  });
  
}

final mueble_data = <MuebleModelData>[

  MuebleModelData(
    name:'Luxury Fash Sofa' , 
    price: 54.99,
    img: [
      'assets/imgs_muebles/sofa1_1.png',
      'assets/imgs_muebles/sofa1_2.png',
      'assets/imgs_muebles/sofa1_3.png',
    ],
    qualification: 4.9, 
    unit: 1, 
    description: 'Minimal Bed is made of by natural wood. The design that is very simple and minimal. This is truly one of the best furnitures in any family for now. Whit 3 different colors you can easly select the best match for you home', 
    category: 'sofa',
    colors:[
      0xFF242f48,
      0xFF580e38,
      0xFF149260,
    ]
    ),

  MuebleModelData(
    name:'Modern Style Sofa' , 
    price: 30.40,
    img: [
      'assets/imgs_muebles/sofa2_1.png',
      'assets/imgs_muebles/sofa2_2.png',
      'assets/imgs_muebles/sofa2_3.png',
    ],
    qualification: 4.3, 
    unit: 1, 
    description: 'Minimal Bed is made of by natural wood. The design that is very simple and minimal. This is truly one of the best furnitures in any family for now. Whit 3 different colors you can easly select the best match for you home', 
    category: 'sofa',
    colors:[
      0xFF514e4e,
      0xFF34a4a5,
      0xFF287649,
    ]
    ),

  MuebleModelData(
    name:'Royal Palm Sofa' , 
    price: 58.18,
    img: [
      'assets/imgs_muebles/sofa4_1.png',
      'assets/imgs_muebles/sofa4_2.png',
      'assets/imgs_muebles/sofa4_3.png',
    ],
    qualification: 4.7, 
    unit: 1, 
    description: 'Minimal Bed is made of by natural wood. The design that is very simple and minimal. This is truly one of the best furnitures in any family for now. Whit 3 different colors you can easly select the best match for you home', 
    category: 'sofa',
    colors:[
      0xFF8c9a97,
      0xFF8586a4,
      0xFFafad79,
    ]
    ),

  MuebleModelData(
    name:'Leatherette Sofa' , 
    price: 44.40,
    img: [
      'assets/imgs_muebles/sofa5_1.png',
      'assets/imgs_muebles/sofa5_2.png',
      'assets/imgs_muebles/sofa5_3.png',
    ],
    qualification: 4.8, 
    unit: 1, 
    description: 'Minimal Bed is made of by natural wood. The design that is very simple and minimal. This is truly one of the best furnitures in any family for now. Whit 3 different colors you can easly select the best match for you home', 
    category: 'sofa',
    colors:[
      0xFF767374,
      0xFF274765,
      0xFF7a623f,
    ]
    ),

  MuebleModelData(
    name:'Dream Ded' , 
    price: 70.33,
    img: [
      'assets/imgs_muebles/bed1_1.png',
      'assets/imgs_muebles/bed1_2.png',
      'assets/imgs_muebles/bed1_3.png',
    ],
    qualification: 4.9, 
    unit: 1, 
    description: 'Minimal Bed is made of by natural wood. The design that is very simple and minimal. This is truly one of the best furnitures in any family for now. Whit 3 different colors you can easly select the best match for you home', 
    category: 'bed',
    colors:[
      0xFF84624b,
      0xFF2ea5b7,
      0xFF4c943c,
    ]
    ),
  MuebleModelData(
    name:'Sweet Dreams' , 
    price: 110.33,
    img: [
      'assets/imgs_muebles/bed2_1.png',
      'assets/imgs_muebles/bed2_2.png',
      'assets/imgs_muebles/bed2_3.png',
    ],
    qualification: 5.0, 
    unit: 1, 
    description: 'Minimal Bed is made of by natural wood. The design that is very simple and minimal. This is truly one of the best furnitures in any family for now. Whit 3 different colors you can easly select the best match for you home', 
    category: 'bed',
    colors:[
      0xFF323133,
      0xFF191919,
      0xFFd1cbaa,
    ]
    ),
];