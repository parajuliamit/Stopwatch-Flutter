import 'package:flutter/material.dart';
import 'home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stopwatch',
      theme: ThemeData.dark().copyWith(
          textTheme: TextTheme(
        bodyText1: TextStyle(color: Colors.white70, fontFamily: 'Montserrat'),
        bodyText2: TextStyle(color: Colors.white70, fontFamily: 'Montserrat'),
      )),
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
