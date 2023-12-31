
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ejercicio_flutter_dam/firestoreObjects/FbUsuario.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class PerfilDataView extends StatelessWidget {
  late BuildContext _context;

  final TextEditingController nombre = TextEditingController();
  final TextEditingController edad = TextEditingController();
  final TextEditingController colorOjos = TextEditingController();

  FirebaseFirestore db = FirebaseFirestore.instance;

  void onClickAceptar(){

    FbUsuario usuario = FbUsuario(name: nombre.text, age: int.parse(edad.text), eyeColor: colorOjos.text);
    // Obtenemos el UID del usuario actualmente autenticado
    String? userID = FirebaseAuth.instance.currentUser?.uid;

    if (userID != null) {
      // Utiliza el UID como el ID del documento en la colección "Usuarios"
      db.collection("Usuarios").doc(userID).set(usuario.toFirestore());
    }
    Navigator.of(_context).popAndPushNamed("/homeView");
  }

  void onClickCancelar(){

    Navigator.of(_context).popAndPushNamed("/loginView");

  }

  @override
  Widget build(BuildContext context) {
    _context = context;

    return Scaffold(
      appBar: AppBar(
        title: Text("Datos Cliente"),
        centerTitle: true,
        backgroundColor: Colors.amberAccent,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 25),
            Text(
              "Datos de su perfil",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50.0),
              child: TextField(
                controller: nombre,
                decoration: InputDecoration(
                  fillColor: Color(0xFFFFE6A5),
                  filled: true,
                  hintText: "Nombre",
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.amberAccent),
                  ),
                ),
              ),
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50.0),
              child: TextFormField(
                controller: edad,
                decoration: InputDecoration(
                  fillColor: Color(0xFFFFE6A5),
                  filled: true,
                  hintText: "Edad",
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.amberAccent),
                  ),
                ),
              ),
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50.0),
              child: TextFormField(
                controller: colorOjos,
                decoration: InputDecoration(
                  fillColor: Color(0xFFFFE6A5),
                  filled: true,
                  hintText: "Color de ojos",
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.amberAccent),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 120,
                ),
                TextButton(
                  onPressed: onClickAceptar,
                  style: ButtonStyle(
                      side: MaterialStateProperty.all(
                          BorderSide(color: Colors.amberAccent))),
                  child: Text(
                    "Aceptar",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                SizedBox(
                  width: 50,
                ),
                TextButton(
                    onPressed: onClickCancelar,
                    style: ButtonStyle(
                        side: MaterialStateProperty.all(
                            BorderSide(color: Colors.amberAccent))),
                    child: Text(
                      "Cancelar",
                      style: TextStyle(color: Colors.black),
                    ))
              ],
            )
          ],
        ),
      ),
    );


  }

}