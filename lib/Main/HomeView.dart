import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ejercicio_flutter_dam/custom/PostCellView.dart';
import 'package:flutter/material.dart';

import '../firestoreObjects/FbUsuario.dart';

class HomeView extends StatefulWidget {
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final FirebaseFirestore db = FirebaseFirestore.instance;
  final List posts = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, //Ajustar el número de columnas aquí
        ),
        itemCount: 1,
        itemBuilder: creaGridItem,
      ),
    );
  }

  void descargaPosts() async{

    CollectionReference<FbPost> reference = db.collection("Post")
        .withConverter(fromFirestore: FbPost.fromFirestore, toFirestore: (FbPost post, _) => post.toFirestore(),);

    QuerySnapshot <FbPost> querySnapshot = await reference.get();

    for(int i = 0; i < querySnapshot.docs.length; i++){
      posts.add(querySnapshot.docs[i].data());
    }

  }

  Widget creaGridItem(BuildContext context, int indice) {

    return PostCellView(sPost: "HOLA QUIERO VER MI PRIMER POST", iColorCode: 400, dFontSize: 20);
  }

  void initState() {
    super.initState();
    // Llama a la función que obtiene los datos al cargar la vista.
    descargaPosts();
  }


}
