  import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PostView extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(title: Text("Titulo"),),
      body: Column(
        children: [
          Text("Titulo"),
          Text("Cuerpo"),
          //Image.network("imagen"),
          TextButton(onPressed: null, child: Text("Compartir"))
        ],
      )
    );
  }
  
  
  
}