import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'MyApp.dart';


Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();  //inicializa todo antes de correr la app
  initFB();
  runApp(MyApp());

}

void initFB () async {

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

}
