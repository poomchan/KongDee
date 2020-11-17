import 'package:flutter/material.dart';

const kBlackHeaderTextStyle = TextStyle(color: Colors.black87, fontSize: 24.0);
const tBoxShadowGlobal = [
  BoxShadow(
      blurRadius: 5.0,
      spreadRadius: 1.0,
      color: Colors.black12,
      offset: Offset(5, 5)),
];

const tLightThemeColorScheme = ColorScheme.light(
    brightness: Brightness.light,
    primary: Color(0xFF3949AB),
    secondary: Color(0xFFFFCA28),
    primaryVariant: Color(0xFF002884),
    secondaryVariant: Color(0xFFC8A415),
    surface: Color(0xFFFFFFFF),
    background: Color(0xFFe8eaf6),
    error: Colors.red,
    onPrimary: Color(0xFFFFFFFF),
    onSecondary: Colors.black,
    onSurface: Colors.black,
    onBackground: Colors.black,
    onError: Colors.white,
  );
