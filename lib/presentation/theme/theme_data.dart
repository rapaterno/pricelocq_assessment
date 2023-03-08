import 'package:flutter/material.dart';
import 'package:pricelocq_assessment/res/colors.dart';

TextStyle headline1 = const TextStyle(
  fontWeight: FontWeight.w500,
  fontSize: 48,
  color: LocqColors.black,
);

TextStyle subtitle2 = const TextStyle(
  fontWeight: FontWeight.w500,
  fontSize: 12,
  color: LocqColors.black,
);

TextStyle caption = const TextStyle(
  fontWeight: FontWeight.w400,
  fontSize: 10,
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
    subtitle2: subtitle2,
    caption: caption,
  ),
);
