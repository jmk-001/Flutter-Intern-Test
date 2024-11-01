import 'package:flutter/material.dart';

const MaterialColor customSwatch = MaterialColor(
  0xFF12D0BF,
  <int, Color>{
    50: Color.fromRGBO(18, 208, 191, .1),
    100: Color.fromRGBO(18, 208, 191, .2),
    200: Color.fromRGBO(18, 208, 191, .3),
    300: Color.fromRGBO(18, 208, 191, .4),
    400: Color.fromRGBO(18, 208, 191, .5),
    500: Color.fromRGBO(18, 208, 191, .6),
    600: Color.fromRGBO(18, 208, 191, .7),
    700: Color.fromRGBO(18, 208, 191, .8),
    800: Color.fromRGBO(18, 208, 191, .9),
    900: Color.fromRGBO(18, 208, 191, 1),
  },
);

final ThemeData appTheme = ThemeData(
  colorScheme: ColorScheme.fromSwatch(
    primarySwatch: customSwatch,
    accentColor: const Color.fromRGBO(18, 208, 191, 1),
  ),
);
