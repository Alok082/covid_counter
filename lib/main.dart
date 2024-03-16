// import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:device_preview/device_preview.dart';

import 'homescreens/HomeScreen.dart';
import 'screens/loginscreen.dart';
import 'screens/signup.dart';
import 'screens/splashscreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseAppCheck.instance.activate(
    webProvider: ReCaptchaV3Provider('recaptcha-v3-site-key'),
    androidProvider: AndroidProvider.debug,
  );
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      key: Key('myApp'),
      debugShowCheckedModeBanner: false,
      title: "Covid Counter App",
      theme: ThemeData(
          scaffoldBackgroundColor: const Color.fromARGB(255, 162, 235, 181)),
      home: SplashScreen(),
      routes: {
        '/loginScreen': (context) => LoginScreen(),
        '/signup': (context) => SignUp(),
        '/homescreen': (context) => HomeScreen(),
      },
    );
  }
}
