import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
              "Bienvenido al login Móvil",
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
                ElevatedButton(
                  onPressed: onClickSolicitarSMS,
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.amberAccent),
                  ),
                  child: Text(
                    "Solicitar SMS",
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

  void onClickSolicitarSMS() {
    _startPhoneNumberVerification();
  }

  Future<void> _startPhoneNumberVerification() async {
    String phoneNumber = tecNumTelefono.text;
    try {
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phoneNumber,
          verificationCompleted: (PhoneAuthCredential credential) {
            FirebaseAuth.instance.signInWithCredential(credential);
            Navigator.of(_context).popAndPushNamed("/homeView");
          },
        verificationFailed: (FirebaseAuthException e) {
          print("Error de verificación: ${e.message}");
        },
        codeSent: (String verificationId, int? resendToken) {},
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
    } catch (e) {
      print("Error al solicitar SMS: $e");
    }
  }
}
