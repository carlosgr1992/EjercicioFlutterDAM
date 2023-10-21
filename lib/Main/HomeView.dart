import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ejercicio_flutter_dam/custom/ButtonMenu.dart';
import 'package:ejercicio_flutter_dam/custom/PostCellView.dart';
import 'package:flutter/material.dart';

import '../firestoreObjects/FbPost.dart';
import '../firestoreObjects/FbUsuario.dart';

class HomeView extends StatefulWidget {
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final FirebaseFirestore db = FirebaseFirestore.instance;
  final List<FbPost> posts = [];
  bool isList = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: isList ? muestraListView() : muestraGridView(),
      ),
      bottomNavigationBar: ButtonMenu(),
    );
  }

  Widget creaItem(BuildContext context, int indice) {
    return PostCellView(
        sPost: posts[indice].body,sTitle: posts[indice].title, iColorCode: 400, dFontSize: 20);
  }

  Widget muestraGridView(){

    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, //Ajustar el número de columnas aquí
    ),
    itemCount: posts.length,
    itemBuilder: creaItem);

}

  Widget muestraListView() {
    return ListView.builder(
      padding: EdgeInsets.all(12),
      itemExtent: 80, //Esto es para poner una separación entre post y post
      itemCount: posts.length,
      itemBuilder: creaItem,
    );
  }

  void descargaPosts() async {
    CollectionReference<FbPost> reference = db.collection("Posts").withConverter(
      fromFirestore: (snapshot, _) => FbPost.fromFirestore(snapshot, null),
      toFirestore: (post, _) => post.toFirestore(),
    );

    QuerySnapshot<FbPost> querySnapshot = await reference.get();

    setState(() {
      posts.addAll(querySnapshot.docs.map((doc) => doc.data()).toList());
    });
  }

  void initState() {
    super.initState();
    // Llama a la función que obtiene los datos al cargar la vista.
    descargaPosts();
  }
}
