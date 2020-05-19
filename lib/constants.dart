import 'package:flutter/material.dart';

const kTimeTextStyle = TextStyle(
  fontSize: 55.0,
);

const kFlagIcon = Icon(
  Icons.outlined_flag,
  size: 35.0,
);
const kResetIcon = Icon(
  Icons.refresh,
  size: 35.0,
);
const kStartIcon = Icon(
  Icons.play_arrow,
  size: 100.0,
);
const kPauseIcon = Icon(
  Icons.pause,
  size: 35.0,
);
const kResumeIcon = Icon(
  Icons.play_arrow,
  size: 35.0,
);

const kGradientBackground = BoxDecoration(
    gradient: RadialGradient(
        radius: 1.0,
        colors: [Color(0xFF352837), Color(0xff3a2b3d), Color(0xFF36323b)],
        stops: [0.3, 0.9, 1.0]));
