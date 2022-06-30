import 'package:flutter/material.dart';
import 'package:mueble_app/services/shared_preferences.dart';
import 'package:mueble_app/services/theme_service.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
   
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFe9ecef),
      appBar: AppBar(
        backgroundColor: Color(0xFFe9ecef),
        centerTitle: true,
        elevation: 0,
        title:const Text('Profile', style: TextStyle(color: Color(0xFF343a40)),),
      ),
      body: Card(
        margin: EdgeInsets.symmetric(horizontal: 30),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20)
        ),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          width: double.infinity,
          height: 200,
          child: Row(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Nombre:', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: Color(0xFF014f86)),),
                  Container(
                    alignment: Alignment.centerLeft,
                    height: 50,
                    width: 200,
                    child: SwitchListTile.adaptive(
                      activeColor: Color(0xFF197278),
                      title: Text('Theme:', style: TextStyle(color: Color(0xFF014f86), fontWeight: FontWeight.w700),),
                      value: Preferences.isDarkModeGet, 
                      onChanged:(value){
                        Preferences.isDarkModeSet = value;
                        final themeData = Provider.of<ThemeService>(context,listen: false );
                        value ? themeData.setDarkMode() : themeData.setLightMode();
                        setState(() {
                          
                        });
                      } 
                      ),
                  )
                ],
              ),
              Spacer(),
               CircleAvatar(
                backgroundColor: Color(0xFF89b0ae),
                backgroundImage: (Preferences.isDarkModeGet == false)
                ? NetworkImage('https://static.wikia.nocookie.net/regularshow/images/8/87/Rigby_-_Voceto.png/revision/latest?cb=20150731011857&path-prefix=es')
                : NetworkImage('http://images1.wikia.nocookie.net/__cb20130529201259/regularshow/es/images/7/70/Mordecai_with_a_bat_by_kol98-d4xopyr-1-.png'),
                  
                radius: 50,
                
              )
            ],
          ),
        )
      )
    );
  }
}