import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterView extends StatelessWidget {
  late BuildContext _context;

  final TextEditingController usuario = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController repeatPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _context = context;

    return Scaffold(
      appBar: AppBar(
        title: Text("Registro"),
        centerTitle: true,
        backgroundColor: Colors.amberAccent,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 25),
          Text(
            "Registro nuevos usuarios",
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
              controller: usuario,
              decoration: InputDecoration(
                fillColor: Color(0xFFFFE6A5),
                filled: true,
                hintText: "Correo electrónico",
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
              controller: password,
              decoration: InputDecoration(
                fillColor: Color(0xFFFFE6A5),
                filled: true,
                hintText: "Contraseña",
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.amberAccent),
                ),
              ),
              obscureText: true,
            ),
          ),
          SizedBox(height: 50),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50.0),
            child: TextFormField(
              controller: repeatPassword,
              decoration: InputDecoration(
                fillColor: Color(0xFFFFE6A5),
                filled: true,
                hintText: "Repetir contraseña",
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
                height: 80,
              ),
              TextButton(
                onPressed: onClickAceptar,
                style: ButtonStyle(
                    side: MaterialStateProperty.all(
                        BorderSide(color: Colors.amberAccent))),
                child: Text(
                  "Registrarme",
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
    );
  }

  void onClickCancelar() {
    Navigator.of(_context).pushNamed("/loginView");
  }

  void onClickAceptar() async {

    if (usuario.text.isEmpty || password.text.isEmpty || repeatPassword.text.isEmpty) {
      ScaffoldMessenger.of(_context).showSnackBar(SnackBar(
        content: Text("Por favor, rellena todos los campos"),
        duration: Duration(seconds: 2),
      ));
    }

    if (password.text == repeatPassword.text) {
      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: usuario.text,
          password: password.text,
        );

        Navigator.of(_context).pushNamed("/loginView");

        ScaffoldMessenger.of(_context).showSnackBar(SnackBar(
            content: Text("¡Cuenta creada con exito!"),
        duration: Duration(seconds: 2),));

      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          ScaffoldMessenger.of(_context).showSnackBar(SnackBar(
            content: Text("Contraseña demasiado corta"),
            duration: Duration(seconds: 2),
          ));
        } else if (e.code == 'email-already-in-use') {
          ScaffoldMessenger.of(_context).showSnackBar(SnackBar(
            content: Text("La cuenta ya existe."),
            duration: Duration(seconds: 2),
          ));
        }
      } catch (e) {
        print(e);
      }
    } else if (password.text != repeatPassword.text) {
      ScaffoldMessenger.of(_context).showSnackBar(
        SnackBar(
          content: Text("Las contraseñas no coinciden"),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }
}
