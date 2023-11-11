import 'package:ejercicio_flutter_dam/Main/HomeView.dart';
import 'package:ejercicio_flutter_dam/Main/HomeViewWeb.dart';
import 'package:ejercicio_flutter_dam/Main/PostView.dart';
import 'package:ejercicio_flutter_dam/onBoarding/LoginView.dart';
import 'package:ejercicio_flutter_dam/onBoarding/PerfilDataView.dart';
import 'package:ejercicio_flutter_dam/onBoarding/RegisterView.dart';
import 'package:ejercicio_flutter_dam/singletone/PlatformAdmin.dart';
import 'package:ejercicio_flutter_dam/splash/SplashApp.dart';
import 'package:flutter/material.dart';

import 'Main/PostCreateView.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if (PlatformAdmin().isWeb || PlatformAdmin().isDesktop) {
      return MaterialApp(
        title: "MyApp",
        routes: {
          "/loginView": (context) => LoginView(),
          "/registerView": (context) => RegisterView(),
          "/splashView": (context) => SplashApp(),
          "/homeViewWeb": (context) => HomeViewWeb(),
          "/perfilDataView": (context) => PerfilDataView(),
          "/postView": (context) => PostView(),
          "/postCreateView": (context) => PostCreateView(),
        },
        initialRoute: "/loginView",
      );
    } else if (PlatformAdmin().isMobile || PlatformAdmin().isTablet) {
      return MaterialApp(
        title: "MyApp",
        routes: {
          "/loginView": (context) => LoginView(),
          "/registerView": (context) => RegisterView(),
          "/splashView": (context) => SplashApp(),
          "/homeView": (context) => HomeView(),
          "/perfilDataView": (context) => PerfilDataView(),
          "/postView": (context) => PostView(),
          "/postCreateView": (context) => PostCreateView(),
        },
        initialRoute: "/splashView",
      );
    } else {
      return MaterialApp(
        title: "MyApp",
        home: Scaffold(
          body: Center(
            child: Text("Plataforma no reconocida, por favor, comuníquese con nosotros para solucionarlo",
            ),
          ),
        ),
      );
    }
  }
}
