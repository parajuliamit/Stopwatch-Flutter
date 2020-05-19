import 'package:flutter/material.dart';

class WatchButton extends StatelessWidget {
  final Color color;
  final Function onPress;
  final Icon icon;

  WatchButton({this.color, this.onPress, this.icon});

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      padding: EdgeInsets.all(15),
      color: Colors.transparent,
      shape: CircleBorder(side: BorderSide(color: color, width: 4)),
      elevation: 0,
      onPressed: onPress,
      child: icon,
    );
  }
}
