import 'package:flutter/material.dart';
import 'package:locator_app/constants/constants.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: kCustomGrey,
    fontFamily: 'SplineSans',
    primaryColor: kCustomBlack,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    colorScheme: const ColorScheme.light(
      primary: kCustomBlack,
      secondary: kCustomLimeGreen,
    ),
    useMaterial3: true,
  );
}
