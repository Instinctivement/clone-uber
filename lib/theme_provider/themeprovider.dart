import 'package:flutter/material.dart';

class MyThemes {
  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.grey.shade900,
    colorScheme: const ColorScheme.dark(),
    useMaterial3: true,
  );
  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    colorScheme: const ColorScheme.light(),
    useMaterial3: true,
  );
}
