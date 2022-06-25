import 'package:flutter/material.dart';

class SaveScreen extends StatelessWidget {
   
  const SaveScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.green,
      body: Center(
         child: Text('SaveScreen'),
      ),
    );
  }
}