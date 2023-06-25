import 'package:clone_uber/screens/register.dart';
import 'package:clone_uber/theme_provider/themeprovider.dart';
import 'package:flutter/material.dart';

import 'screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: MyThemes.darkTheme,//C'est ici que je dois changer
      darkTheme: MyThemes.darkTheme,
      home: const RegisterPage(),
    );
  }
}
