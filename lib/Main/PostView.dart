  import 'package:ejercicio_flutter_dam/singletone/DataHolder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PostView extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(title: Text("Post"),),
      body: Column(
        children: [
          Text(DataHolder().selectedPost.title),
          Text(DataHolder().selectedPost.body),
          Image.network(DataHolder().selectedPost.urlImg),
          TextButton(onPressed: null, child: Text("Compartir"))
        ],
      )
    );
  }
  
  
  
}