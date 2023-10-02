

import 'package:ejercicio_flutter_dam/onBoarding/LoginView.dart';
import 'package:ejercicio_flutter_dam/onBoarding/RegisterView.dart';
import 'package:ejercicio_flutter_dam/splash/SplashApp.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: "MyApp",
      routes: {
        "/loginView": (context) => LoginView(),
        "/registerView": (context) => RegisterView(),
        "/splashView": (context) => SplashApp(),
      },
      initialRoute: "/splashView",
    );

  }

}