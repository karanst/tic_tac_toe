import 'package:flutter/material.dart';
import 'package:tic_tac_toe/home_page.dart';
import 'package:tic_tac_toe/welcome.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
       debugShowCheckedModeBanner: false,
      home: Welcome()
    
    );
  }
}



