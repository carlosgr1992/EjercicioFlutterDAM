import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ejercicio_flutter_dam/singletone/DataHolder.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../firestoreObjects/FbUsuario.dart';
import '../singletone/PlatformAdmin.dart';

class LoginView extends StatelessWidget {
  late final BuildContext _context;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  FirebaseFirestore db = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    _context = context;

    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
        centerTitle: true,
        backgroundColor: Colors.amberAccent,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 80),
            Text(
              "Bienvenido al login",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 80),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50.0),
              child: TextField(
                controller: emailController,
                decoration: InputDecoration(
                  fillColor: Color(0xFFFFE6A5),
                  filled: true,
                  hintText: "Introduzca su usuario",
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
                controller: passwordController,
                decoration: InputDecoration(
                  fillColor: Color(0xFFFFE6A5),
                  filled: true,
                  hintText: "Introduzca su contraseña",
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.amberAccent),
                  ),
                ),
                obscureText: true,
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
                    "Login",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                SizedBox(
                  width: 50,
                ),
                TextButton(
                    onPressed: onClickRegistrar,
                    style: ButtonStyle(
                        side: MaterialStateProperty.all(
                            BorderSide(color: Colors.amberAccent))),
                    child: Text(
                      "Registrar",
                      style: TextStyle(color: Colors.black),
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }

  void onClickRegistrar() {
    Navigator.of(_context).pushNamed("/registerView");
  }

  void onClickAceptar() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      // Llama a compruebaSesion para decidir a qué pantalla ir
      compruebaSesion();
    } on FirebaseAuthException catch (e) {
      // Manejo de excepciones
    }
  }

  void compruebaSesion() async {
    String uid = FirebaseAuth.instance.currentUser!.uid;

    DocumentReference<FbUsuario> ref = db.collection("Usuarios")
        .doc(uid)
        .withConverter(
      fromFirestore: FbUsuario.fromFirestore,
      toFirestore: (FbUsuario usuario, _) => usuario.toFirestore(),
    );

    DocumentSnapshot<FbUsuario> docSnap = await ref.get();

    // Verifica si hay datos antes de acceder a ellos
    if (docSnap.exists) {
      FbUsuario usuario = docSnap.data()!; // Ahora estamos seguros de que no es nulo
      (PlatformAdmin().isWeb || PlatformAdmin().isDesktop) ? Navigator.of(_context).popAndPushNamed("/homeViewWeb")
                                                           : Navigator.of(_context).popAndPushNamed("/homeView");
    } else {
      Navigator.of(_context).popAndPushNamed("/perfilDataView");
    }
  }
}
