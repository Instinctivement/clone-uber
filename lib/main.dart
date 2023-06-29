import 'package:clone_uber/screens/login.dart';
import 'package:clone_uber/screens/register.dart';
import 'package:clone_uber/splash_screen/splashscreen.dart';
import 'package:clone_uber/theme_provider/themeprovider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

//import 'screens/home.dart';

Future <void> main() async {
  runApp(const MyApp());
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
      home: const SplashScreen(),
    );
  }
}
