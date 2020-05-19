import 'package:flutter/material.dart';

class LapTile extends StatelessWidget {
  final int lapNumber;
  final String lapTime;
  final Color textColor;

  LapTile({this.lapTime, this.lapNumber, this.textColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Lap $lapNumber',
            style: TextStyle(fontSize: 15.0),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            '$lapTime',
            style: TextStyle(color: textColor, fontSize: 20.0),
          )
        ],
      ),
    );
  }
}
