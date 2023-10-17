import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

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

  void onClickAceptar() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
      );

          compruebaSesion();

      ScaffoldMessenger.of(_context).showSnackBar(SnackBar(
        content: Text("¡Login realizado con éxito!"),
        duration: Duration(seconds: 2),
      ));


    } on FirebaseAuthException catch (e) {
      print('Código de la excepción: ${e.code}');
      if (e.code == 'INVALID_LOGIN_CREDENTIALS') {
        ScaffoldMessenger.of(_context).showSnackBar(
          SnackBar(
              content: Text("Credenciales inválidas"),
              duration: Duration(seconds: 2)),
        );
      } else if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(_context).showSnackBar(SnackBar(
          content: Text("Usuario no encontrado"),
          duration: Duration(seconds: 2),
        ));
      } else if (e.code == 'wrong-password') {
        ScaffoldMessenger.of(_context).showSnackBar(SnackBar(
          content: Text("Contraseña incorrecta"),
          duration: Duration(seconds: 2),
        ));
      }
    }
  }

  void onClickRegistrar() {
    Navigator.of(_context).pushNamed("/registerView");
  }

  void compruebaSesion() async {
    if (FirebaseAuth.instance.currentUser != null) {
      //Guardamos el uid del usuario conectado actualmente en la variable uid
      String uid = FirebaseAuth.instance.currentUser!.uid;
      //recibimos los datos del usuario, ponemos await para que espere a que acabe de cargar los datos del usuario
      DocumentSnapshot<Map<String, dynamic>> datos = await db.collection("Usuarios").doc(uid).get();
      if (datos.exists) {
        Navigator.of(_context).popAndPushNamed("/homeView");
      } else {
        Navigator.of(_context).popAndPushNamed("/perfilDataView");
      }
    }
  }
}
