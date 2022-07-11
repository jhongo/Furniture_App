import 'package:flutter/material.dart';
import 'package:mueble_app/screens/screens.dart';
import 'package:mueble_app/services/menu_opc_preferences.dart';
import 'package:mueble_app/services/navbar_service.dart';
import 'package:mueble_app/services/shared_preferences.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
   
  const HomeScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    final navBar = Provider.of<NavBarService>(context);
    final opcMenu = Provider.of<MenuOpcPreferences>(context);
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: opcMenu.pageControllerGet,
            physics: NeverScrollableScrollPhysics(),
          children: [
            ProductScreen(),
            SaveScreen(),
            NotificationScreen(),
            ProfileScreen()
           ],     
          ),
          const Positioned(
            right: 0,
            left: 0,
            bottom: 0,
            child: _CustomNavBar()
            )
        ],
      )
    );
  }
}

class _CustomNavBar extends StatelessWidget {
  const _CustomNavBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: kToolbarHeight,
      color: Colors.white.withOpacity(0.9),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children:const [
          IconItem(icon: Icons.home, index: 0,),
          IconItem(icon: Icons.bookmark_border_rounded, index: 1,),
          IconItem(icon: Icons.notifications_none_outlined, index: 2,),
          IconItem(icon: Icons.person_outline_outlined, index: 3,),
        ],
      ),
    );
  }
}

class IconItem extends StatelessWidget {

  final IconData icon;
  final int index;
  const IconItem({Key? key, required this.icon, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final opcIndex = Provider.of<NavBarService>(context);
    final opcMenu = Provider.of<MenuOpcPreferences>(context);
    return GestureDetector(
      onTap: () {
        opcMenu.optMenuSet = index;
      },
      child: Container(
        child: (opcMenu.optMenuGet == index)
        ? Icon(  icon,size: 25, color: Colors.black, )
        : Icon(  icon,size: 23, color: Color(0xFF4a4e69), ),
      ),
    );
  }
}


