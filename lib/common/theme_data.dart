import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:rot_application/common/colors.dart';
import 'package:rot_application/common/text_styles.dart';

class MThemeData {
  static ThemeData themeData({
    String? fontFamily,
    bool lightTheme = true,
  }) {
    return ThemeData(
      appBarTheme: AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: AppLightColors().primary,
          statusBarBrightness: lightTheme ? Brightness.light : Brightness.dark,
          // For iOS: (dark icons)
          statusBarIconBrightness: lightTheme
              ? Brightness.light
              : Brightness.dark, // For Android(M and greater): (dark icons)
        ),
      ),
      textTheme: MTextTheme().myTextTheme(
          fontFamily: fontFamily,
          colors: lightTheme ? AppLightColors() : AppDarkColors()),
      primaryColor:
          lightTheme ? AppLightColors().primary : AppDarkColors().primary,
      scaffoldBackgroundColor: lightTheme
          ? AppLightColors().scaffoldBackgroundColor
          : AppDarkColors().scaffoldBackgroundColor,
      colorScheme: Methods.colorScheme(
          colors: lightTheme ? AppLightColors() : AppDarkColors(),
          lightTheme: lightTheme),
      textSelectionTheme:
          TextSelectionThemeData(cursorColor: AppLightColors().text),
      /* inputDecorationTheme: Methods.inputDecorationTheme(
          colors: lightTheme ? AppLightColors() : AppDarkColors()),
      elevatedButtonTheme: Methods.elevatedButtonTheme(
          colors: lightTheme ? AppLightColors() : AppDarkColors()),
      textButtonTheme: Methods.textButtonTheme(
          colors: lightTheme ? AppLightColors() : AppDarkColors()),
      outlinedButtonTheme: Methods.outlinedButtonTheme(
          colors: lightTheme ? AppLightColors() : AppDarkColors()),*/
    );
  }
}

class Methods {
  static ColorScheme colorScheme({dynamic colors, bool lightTheme = true}) {
    return ColorScheme(
      primary: colors.primary,
      onPrimary: colors.onPrimary,
      secondary: colors.scaffoldBackgroundColor,
      onSecondary: colors.caption,
      error: colors.error,
      brightness: lightTheme ? Brightness.light : Brightness.dark,
      onError: colors.success,
      background: colors.scaffoldBackgroundColor,
      onBackground: colors.scaffoldBackgroundColor,
      surface: colors.scaffoldBackgroundColor,
      onSurface: colors.onText,
      onSecondaryContainer: colors.inActiveColor,
    );
  }

  static InputDecorationTheme inputDecorationTheme({dynamic colors}) {
    return InputDecorationTheme(
      contentPadding: const EdgeInsets.only(top: 1),
      constraints: BoxConstraints(maxHeight: 70.px),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(width: 1, color: colors.onPrimary),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(width: 1, color: colors.primary),
      ),
      errorBorder: UnderlineInputBorder(
        borderSide: BorderSide(width: 2, color: colors.error),
      ),
      focusedErrorBorder: UnderlineInputBorder(
        borderSide: BorderSide(width: 2, color: colors.error),
      ),
    );
  }

  static ElevatedButtonThemeData elevatedButtonTheme({dynamic colors}) {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.px),
        ),
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
      ),
    );
  }

  static TextButtonThemeData textButtonTheme({dynamic colors}) {
    return TextButtonThemeData(
      style: TextButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(7.px),
        ),
        padding: EdgeInsets.zero,
        foregroundColor: colors.primary,
      ),
    );
  }

  static OutlinedButtonThemeData outlinedButtonTheme({dynamic colors}) {
    return OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.px),
          ),
          foregroundColor: colors.text,
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          padding: EdgeInsets.all(3.5.px),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap),
    );
  }
}
