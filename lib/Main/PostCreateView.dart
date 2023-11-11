import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ejercicio_flutter_dam/firestoreObjects/FbPost.dart';
import 'package:ejercicio_flutter_dam/singletone/DataHolder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PostCreateView extends StatelessWidget {
  final TextEditingController tecTitulo = TextEditingController();
  final TextEditingController tecCuerpo = TextEditingController();
  FirebaseFirestore db = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Nuevo Post"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: tecTitulo,
              decoration: InputDecoration(
                fillColor: Color(0xFFFFE6A5),
                filled: true,
                hintText: "Título",
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.amberAccent),
                ),
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: tecCuerpo,
              decoration: InputDecoration(
                fillColor: Color(0xFFFFE6A5),
                filled: true,
                hintText: "Introduzca cuerpo del post",
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.amberAccent),
                ),
              ),
            ),
            //Image.network(""),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {

               cargaPost(context);
              },
              child: Text("Postear"),
            ),
          ],
        ),
      ),
    );
  }

  void cargaPost(BuildContext context) async {
    String titulo = tecTitulo.text;
    String cuerpo = tecCuerpo.text;


    FbPost postNuevo = new FbPost(title: tecTitulo.text, body: tecCuerpo.text, urlImg: "");

    CollectionReference<FbPost> postsRef = db.collection("Posts")
        .withConverter(
      fromFirestore: FbPost.fromFirestore,
      toFirestore: (FbPost post, _) => post.toFirestore(),
    );

    postsRef.add(postNuevo);
    Navigator.of(context).pushNamed("/homeView");
  }
}
