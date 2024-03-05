import 'package:flutter/material.dart';

abstract class AppColors {
  Color get primary;

  Color get onPrimary;

  Color get scaffoldBackgroundColor;

  Color get success;

  Color get error;

  Color get caption;

  Color get text;

  Color get onText;

  Color get inActiveColor;
}

class AppLightColors extends AppColors {
  @override
  Color get primary => const Color(0xff009788);

  @override
  Color get caption => const Color(0xff949494);

  @override
  Color get error => const Color(0xffff0000);

  @override
  Color get onText => const Color(0xffFFFFFF);

  @override
  Color get scaffoldBackgroundColor => const Color(0xffFFFFFF);

  @override
  Color get text => const Color(0xff000000);

  @override
  Color get success => const Color(0xff4BB543);

  @override
  Color get onPrimary => const Color(0xffE3E3E3);

  @override
  Color get inActiveColor => const Color(0xffCACACA);
}

class AppDarkColors extends AppColors {
  @override
  Color get primary => const Color(0xff009788);

  @override
  Color get caption => const Color(0xff949494);

  @override
  Color get error => const Color(0xffff0000);

  @override
  Color get onText => const Color(0xffFFFFFF);

  @override
  Color get scaffoldBackgroundColor => const Color(0xffFFFFFF);

  @override
  Color get text => const Color(0xff000000);

  @override
  Color get success => const Color(0xff4BB543);

  @override
  Color get onPrimary => const Color(0xffE3E3E3);

  @override
  Color get inActiveColor => const Color(0xffCACACA);
}
