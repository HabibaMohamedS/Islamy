import 'package:flutter/material.dart';

class Themes {
  static ThemeData light = ThemeData(
    appBarTheme: AppBarTheme(backgroundColor: Colors.transparent),
    dividerTheme: DividerThemeData(color: Color(0xFFB7935F)),
    textTheme: TextTheme(
        titleLarge: TextStyle(
            color: Colors.black, fontSize: 25, fontWeight: FontWeight.w600),
        displayMedium: TextStyle(
            color: Colors.black, fontWeight: FontWeight.w400, fontSize: 25),
        displaySmall: TextStyle(fontWeight: FontWeight.w400, fontSize: 20.5)),
    colorScheme: ColorScheme(
        brightness: Brightness.light,
        primary: Color(0xFFB7935F),
        onPrimary: Color(0xFFB7935F),
        secondary: Colors.black,
        onSecondary: Colors.black,
        error: Colors.red,
        onError: Colors.red,
        surface: Colors.white,
        onSurface: Colors.white,
        background: Colors.transparent,
        onBackground: Colors.transparent),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Color(0xFFB7935F),
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.white),
    primaryColor: Color(0xFFB7935F),
  );
  static ThemeData dark = ThemeData(
      dividerTheme: DividerThemeData(color: Color(0xFFFACC1D)),
      textTheme: TextTheme(
          titleLarge: TextStyle(
              color: Colors.black, fontSize: 25, fontWeight: FontWeight.w600),
          displayMedium: TextStyle(fontWeight: FontWeight.w400, fontSize: 25),
          displaySmall: TextStyle(fontWeight: FontWeight.w400, fontSize: 20.5)),
      colorScheme: ColorScheme(
          brightness: Brightness.dark,
          primary: Color(0xFFFACC1D),
          onPrimary: Color(0xFFFACC1D),
          secondary: Color(0xFF141A2E),
          onSecondary: Color(0xFFFACC1D),
          error: Colors.red,
          onError: Colors.red,
          surface: Colors.white,
          onSurface: Colors.white,
          background: Colors.transparent,
          onBackground: Colors.transparent),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Color(0xFF141A2E),
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Color(0xFFFACC1D),
          unselectedItemColor: Colors.white),
      highlightColor: Color(0xFFFACC1D));
}
