

import 'package:flutter/material.dart';

class SplashApp extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {

    return _SplashApp();
  }

}

class _SplashApp extends State<StatefulWidget>{
  @override
  Widget build(BuildContext context) {

    return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 50),
      child: Column(
      children: [
        Image.asset("images/flutter.jpg",height: 400,width: 500,),
        Text("Cargando...",style: TextStyle(fontSize: 25,color: Colors.black, decoration: TextDecoration.none)),
        SizedBox(height: 25),
        CircularProgressIndicator()
      ],
    )
    );
  }



}