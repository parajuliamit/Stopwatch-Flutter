import 'dart:async';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'button.dart';
import 'lap_tile.dart';
import 'lap_time.dart';

class TimerScreen extends StatefulWidget {
  @override
  _TimerScreenState createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen> {
  LapTime lapTime = LapTime();

  int ms;
  int sec;
  int min;
  int hr;

  Stopwatch stopwatch = Stopwatch();
  Duration duration = Duration(milliseconds: 33);
  Icon leftButtonIcon = kStartIcon;
  Icon rightButtonIcon = kResetIcon;
  String mergedTime = '00.00.00';

  void resetWatch() {
    stopwatch.reset();
    Navigator.pop(context);
  }

  void startStopwatch() {
    setState(() {
      leftButtonIcon = kPauseIcon;
      rightButtonIcon = kFlagIcon;
    });
    stopwatch.start();
    Timer.periodic(duration, getTime);
  }

  void getTime(Timer timer) {
    if (!stopwatch.isRunning) {
      timer.cancel();
      return;
    }
    int time = stopwatch.elapsedMilliseconds;
    int givenTime = time ~/ 10;
    setState(() {
      ms = givenTime % 100;
    });
    givenTime ~/= 100;
    if (givenTime % 60 != sec) {
      setState(() {
        sec = givenTime % 60;
      });
    }
    givenTime ~/= 60;
    if (givenTime % 60 != min) {
      setState(() {
        min = givenTime % 60;
      });
    }
    givenTime ~/= 60;
    if (givenTime != hr) {
      setState(() {
        hr = givenTime;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    ms = 0;
    sec = 0;
    min = 0;
    hr = 0;
    startStopwatch();
  }

  @override
  Widget build(BuildContext context) {
    String hour = hr < 10 ? '0$hr' : '$hr';
    String minute = min < 10 ? '0$min' : '$min';
    String second = sec < 10 ? '0$sec' : '$sec';
    String millisecond = ms < 10 ? '0$ms' : '$ms';
    return Scaffold(
      body: Container(
        decoration: kGradientBackground,
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  'Stopwatch',
                  style: TextStyle(fontSize: 30.0),
                ),
              ),
            ),
            Expanded(
              child: Container(
                child: TimeFormat(
                    hour: hour,
                    minute: minute,
                    second: second,
                    millisecond: millisecond),
              ),
            ),
            Expanded(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Hero(
                          tag: 'play',
                          child: WatchButton(
                            color: Color(0xFF3d0ead),
                            onPress: () {
                              if (stopwatch.isRunning) {
                                stopwatch.stop();
                                setState(() {
                                  leftButtonIcon = kResumeIcon;
                                  rightButtonIcon = kResetIcon;
                                });
                                return;
                              }
                              startStopwatch();
                            },
                            icon: leftButtonIcon,
                          ),
                        ),
                        WatchButton(
                          onPress: () {
                            if (stopwatch.isRunning) {
                              mergedTime = hr != 0
                                  ? '$hour.$minute.$second.$millisecond'
                                  : '$minute.$second.$millisecond';
                              setState(() {
                                lapTime.addLap(mergedTime);
                              });
                              return;
                            }
                            resetWatch();
                          },
                          icon: rightButtonIcon,
                          color: Color(0xFFc04074),
                        )
                      ],
                    ),
                    Flexible(
                      child: Container(
                          margin: EdgeInsets.symmetric(vertical: 20.0),
                          height: 100,
                          width: MediaQuery.of(context).size.width,
                          child: ListView.builder(
                              itemCount: lapTime.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return index == 0
                                    ? LapTile(
                                        lapTime: lapTime.lap[index].time,
                                        lapNumber: lapTime.lap[index].index,
                                        textColor: Colors.white,
                                      )
                                    : LapTile(
                                        lapTime: lapTime.lap[index].time,
                                        lapNumber: lapTime.lap[index].index,
                                      );
                              })),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class TimeFormat extends StatelessWidget {
  TimeFormat({
    @required this.hour,
    @required this.minute,
    @required this.second,
    @required this.millisecond,
  });

  final String hour;
  final String minute;
  final String second;
  final String millisecond;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(hour != '00' ? hour : '', style: kTimeTextStyle),
        Text(hour != '00' ? '.' : '', style: kTimeTextStyle),
        Text(minute != '00' ? minute : '', style: kTimeTextStyle),
        Text(minute != '00' ? '.' : '', style: kTimeTextStyle),
        Text(second, style: kTimeTextStyle),
        Text('.', style: kTimeTextStyle),
        Container(
            width: 100.0, child: Text(millisecond, style: kTimeTextStyle)),
      ],
    );
  }
}
