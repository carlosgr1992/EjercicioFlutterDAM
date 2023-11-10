import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ejercicio_flutter_dam/custom/ButtonMenu.dart';
import 'package:ejercicio_flutter_dam/custom/DrawerClass.dart';
import 'package:ejercicio_flutter_dam/custom/PostCellView.dart';
import 'package:ejercicio_flutter_dam/singletone/DataHolder.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../firestoreObjects/FbPost.dart';
import '../firestoreObjects/FbUsuario.dart';
import '../onBoarding/LoginView.dart';

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
      drawer: DrawerClass(onItemTap: funcHomeDrawerTap),
      bottomNavigationBar: ButtonMenu(evento: botonPressed), //El evento de la clase ButtonMenu se lo paso(el indice) y lo que quiero que haga lo meto en el metodo botonPressed
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed("/postCreateView");
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void funcHomeDrawerTap(int indice){

    if(indice==0){
      FirebaseAuth.instance.signOut();
      Navigator.of(context).pushAndRemoveUntil (
        MaterialPageRoute (builder: (BuildContext context) =>  LoginView()),
        ModalRoute.withName('/loginview'),
      );
    }
    else if(indice==1){
      exit(0);
    }
  }

  void botonPressed(int indice){

    setState(() {
      if(indice == 0){
        isList = true;
      }else if (indice == 1){
        isList = false;
      }
    });

  }

  Widget creaItem(BuildContext context, int indice) {
    return PostCellView(
        sPost: posts[indice].body,sTitle: posts[indice].title,iPosicion: indice, onTapClicked: onItemListClicked,  iColorCode: 400, dFontSize: 20);
  }

void onItemListClicked(int indice){

    DataHolder().selectedPost = posts[indice];
    Navigator.of(context).pushNamed("/postView");

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
