import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginViewMobile extends StatelessWidget {
  late final BuildContext _context;
  final TextEditingController tecNumTelefono = TextEditingController();
  final TextEditingController tecVerificacion = TextEditingController();

  FirebaseFirestore db = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    _context = context;

    return Scaffold(
      appBar: AppBar(
        title: Text("Login móvil"),
        centerTitle: true,
        backgroundColor: Colors.amberAccent,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 80),
            Text(
              "Bienvenido al login Movil",
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
                controller: tecNumTelefono,
                decoration: InputDecoration(
                  fillColor: Color(0xFFFFE6A5),
                  filled: true,
                  hintText: "Introduzca su número de teléfono",
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.amberAccent),
                  ),
                ),
              ),
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50.0),
              child: TextField(
                controller: tecVerificacion,
                decoration: InputDecoration(
                  fillColor: Color(0xFFFFE6A5),
                  filled: true,
                  hintText: "Introduzca su código de verificación",
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.amberAccent),
                  ),
                ),
              ),
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 90,
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
              ],
            )
          ],
        ),
      ),
    );
  }

  void onClickAceptar(){

    print("aceptado!");

  }

  }