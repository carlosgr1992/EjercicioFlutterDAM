  import 'package:flutter/material.dart';
  import 'package:firebase_core/firebase_core.dart';
  import 'firebase_options.dart';
  import 'MyApp.dart';


  void main() async {

    WidgetsFlutterBinding.ensureInitialized();  // inicializa todo antes de correr la app
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    runApp(MyApp());

  }

