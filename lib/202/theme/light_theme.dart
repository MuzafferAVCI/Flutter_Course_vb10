import 'package:flutter/material.dart';

class LightTheme {
  final _lightColor = _LightColor();
  late ThemeData theme;

  LightTheme() {
    theme = ThemeData(
        appBarTheme: const AppBarTheme(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)))),
        scaffoldBackgroundColor: Colors.white.withOpacity(0.9),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(backgroundColor: Colors.green),
        buttonTheme: ButtonThemeData(
            colorScheme: ColorScheme.light(onPrimary: Colors.purple, secondary: _LightColor().deepOrange)),
        colorScheme: const ColorScheme.light(),
        checkboxTheme: CheckboxThemeData(
            fillColor: MaterialStateProperty.all(Colors.green), side: const BorderSide(color: Colors.green)),
        textTheme:
            ThemeData.light().textTheme.copyWith(titleMedium: TextStyle(fontSize: 25, color: _lightColor._textColor)));
    //Burada yazdıklarım dırek theme halınde kullanılıyor. yanı dırekt "titleMedium'un" yapısını
    //istediğim gibi değiştirebılıyorum.
  }
}

class _LightColor {
  final Color _textColor = const Color.fromARGB(234, 123, 32, 42);
  final Color blueRibbon = const Color.fromARGB(0, 97, 255, 1);
  final Color deepOrange = const Color.fromARGB(217, 80, 0, 1);
}
