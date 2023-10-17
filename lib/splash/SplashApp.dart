
  import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
  import 'package:flutter/material.dart';

  FirebaseFirestore db = FirebaseFirestore.instance;

  class SplashApp extends StatefulWidget{

    @override
    State<StatefulWidget> createState() {
      return _SplashApp();
    }
  }
  void checkSession(BuildContext context) async {

  await Future.delayed(Duration (seconds: 3));
  if(FirebaseAuth.instance.currentUser != null){
    Navigator.of(context).popAndPushNamed("/homeView");
  }else{
    Navigator.of(context).popAndPushNamed("/loginView");
  }

  }

  class _SplashApp extends State<StatefulWidget>{

    @override
    void initState() {
      super.initState();
      checkSession(context);
    }

    @override
    Widget build(BuildContext context) {

      return Container(
        color: Colors.white,  // Fondo blanco
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 50),
          child: Column(
            children: [
              Image.asset("images/flutter.jpg", height: 400, width: 500),
              Text("Cargando...", style: TextStyle(fontSize: 25, color: Colors.black, decoration: TextDecoration.none)),
              SizedBox(height: 25),
              CircularProgressIndicator(),
            ],
          ),
        ),
      );
    }
  }