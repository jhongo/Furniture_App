import 'package:flutter/material.dart';
import 'package:mueble_app/screens/screens.dart';
import 'package:mueble_app/services/category_service.dart';
import 'package:mueble_app/services/menu_opc_preferences.dart';
import 'package:mueble_app/services/navbar_service.dart';
import 'package:mueble_app/services/shared_preferences.dart';
import 'package:mueble_app/services/theme_service.dart';
import 'package:mueble_app/services/unit_service.dart';
import 'package:provider/provider.dart';

void main() async {

  final prefsMenu = MenuOpcPreferences();

  WidgetsFlutterBinding.ensureInitialized();
  await Preferences.init();
  await prefsMenu.optionsMenuGet();
  await prefsMenu.optionsMenuSet();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create:(context) => NavBarService()),
        ChangeNotifierProvider(create:(context) => CategoryService()),
        ChangeNotifierProvider(create:(context) => UnitService()),
        ChangeNotifierProvider(create:(context) => MenuOpcPreferences(),),
        ChangeNotifierProvider(create:(context) => ThemeService(isDarkMode: Preferences.isDarkModeGet)),
        
      ],
      child: MyApp()
      )
    );

}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
      theme: Provider.of<ThemeService>(context).currentTheme
    );
  }
}