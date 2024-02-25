import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../reusable_Widget/resuable_widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({
    super.key,
  });

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      User? user = FirebaseAuth.instance.currentUser;

      // Navigate based on the authentication state
      if (user != null) {
        // User is already logged in, navigate to HomeScreen
        Navigator.of(context).pushReplacementNamed('/homescreen');
      } else {
        // User is not logged in, navigate to LoginScreen
        Navigator.of(context).pushReplacementNamed('/loginScreen');
      }
    });
    // Navigator.of(context).pushReplacementNamed("/loginScreen");
  }
  //

  @override
  Widget build(BuildContext context) {
    return covidlogo('asset/covidimage.png');
  }
}
