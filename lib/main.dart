import 'package:flutter/material.dart';
import 'package:mueble_app/screens/screens.dart';
import 'package:mueble_app/services/category_service.dart';
import 'package:mueble_app/services/navbar_service.dart';
import 'package:mueble_app/services/unit_service.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create:(context) => NavBarService()),
        ChangeNotifierProvider(create:(context) => CategoryService()),
        ChangeNotifierProvider(create:(context) => UnitService()),
        
      ],
      child:const MaterialApp(
        title: 'Material App',
        debugShowCheckedModeBanner: false,
        home: HomeScreen()
      ),
    );
  }
}