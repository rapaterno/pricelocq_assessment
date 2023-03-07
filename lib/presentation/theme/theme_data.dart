import 'package:flutter/material.dart';
import 'package:pricelocq_assessment/res/colors.dart';

TextStyle headline1 = const TextStyle(
  fontWeight: FontWeight.w500,
  fontSize: 48,
  color: LocqColors.black,
);

TextStyle subtitle1 = const TextStyle(
  fontWeight: FontWeight.w500,
  fontSize: 16,
  color: LocqColors.black,
);

TextStyle button = const TextStyle(
  fontWeight: FontWeight.w500,
  fontSize: 18,
  color: LocqColors.black,
);

ThemeData theme = ThemeData(
  brightness: Brightness.light,
  backgroundColor: Colors.white,
  colorScheme: ColorScheme.fromSeed(
    seedColor: LocqColors.purple,
  ),
  textTheme: TextTheme(
    headline1: headline1,
    subtitle1: subtitle1,
    button: button,
  ),
);
