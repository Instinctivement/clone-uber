import 'dart:async';

import 'package:clone_uber/assistants/assistant_methods.dart';
import 'package:clone_uber/global/global.dart';
import 'package:clone_uber/screens/home.dart';
import 'package:clone_uber/screens/login.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  startTimer(){
    Timer(Duration(seconds: 2), () async {
      if (await firebaseAuth.currentUser != null) {
        firebaseAuth.currentUser != null ? AssistantMethods.readCurrentOnlineInfo() : null ;

        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const MainPage()),
        );
      }else{
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const LoginPage()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Billions",style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),),
      ),
    );
  }
}
