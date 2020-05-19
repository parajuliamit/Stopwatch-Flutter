import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'timer_screen.dart';
import 'button.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff3a2b3d),
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Stopwatch',
          style: TextStyle(
              color: Colors.white70, fontFamily: 'Montserrat', fontSize: 30.0),
        ),
      ),
      body: Container(
        width: double.infinity,
        decoration: kGradientBackground,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              child: Hero(
                tag: 'play',
                child: WatchButton(
                  color: Color(0xFF3d0ead),
                  onPress: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return TimerScreen();
                    }));
                  },
                  icon: kStartIcon,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
