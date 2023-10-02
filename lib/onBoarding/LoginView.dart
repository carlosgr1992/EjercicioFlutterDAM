import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {

  late BuildContext _context;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _context = context;

    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
        centerTitle: true,
        backgroundColor: Colors.amberAccent,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 25),
          Text(
            "Bienvenido al login",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 120),
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
          SizedBox(height: 50),
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
              SizedBox(height: 80,),
              TextButton(onPressed: onClickAceptar,
                style: ButtonStyle(
                  side: MaterialStateProperty.all(BorderSide(color: Colors.amberAccent))
                ),
                child: Text("Login",
                style: TextStyle(
                  color: Colors.black
                ),),),
              SizedBox(width: 50,),
              TextButton(onPressed: onClickRegistrar,
                  style: ButtonStyle(
                      side: MaterialStateProperty.all(BorderSide(color: Colors.amberAccent))
                  ),
                  child: Text("Registrar",
                  style: TextStyle(color: Colors.black),))
            ],
          )
        ],
      ),
    );
  }

  void onClickAceptar(){

    iniciarSesion(emailController,passwordController);

  }

  void onClickRegistrar(){

      Navigator.of(_context).pushNamed("/registerView");

  }

  Future<void> iniciarSesion(TextEditingController email, TextEditingController password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email.text,
        password: password.text,
      );
      ScaffoldMessenger.of(_context).showSnackBar(SnackBar(content: Text("¡Login realizado con éxito!"),duration: Duration(seconds: 2),));
      Navigator.pushNamed(_context, '/splashView');


    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
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

}