import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class LoginViewMobile extends StatefulWidget{
  @override
  State<LoginViewMobile> createState() => _LoginViewMobileState();
}

class _LoginViewMobileState extends State<LoginViewMobile> {

  TextEditingController tecNumTelefono=TextEditingController();
  TextEditingController tecNumVerificacion=TextEditingController();
  String codigoVerificacion="";
  bool blMostrarVerificacion=false;

  void generaCodigoSMS() async{

    String sTelefono=tecNumTelefono.text;

    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: sTelefono,
        verificationCompleted: verificacionCompletada,
        verificationFailed: verificacionFallida,
        codeSent: codigoEnviado,
        codeAutoRetrievalTimeout: tiempoDeEsperaAcabado);
  }

  void verificaCodigo() async{
    String smsCode = tecNumVerificacion.text;

    PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: codigoVerificacion, smsCode: smsCode);

    await FirebaseAuth.instance.signInWithCredential(credential);

    Navigator.of(context).popAndPushNamed("/homeView");
  }

  void verificacionCompletada(PhoneAuthCredential credencial) async{

    await FirebaseAuth.instance.signInWithCredential(credencial);

    Navigator.of(context).popAndPushNamed("/homeView");
  }

  void verificacionFallida(FirebaseAuthException excepcion){
    if (excepcion.code == 'invalid-phone-number') {
      print('The provided phone number is not valid.');
    }
  }

  void codigoEnviado(String codigo, int? resendToken) async{

    codigoVerificacion=codigo;

    setState(() {
      blMostrarVerificacion=true;
    });


  }

  void tiempoDeEsperaAcabado(String verID){

  }

  Widget build(BuildContext context) {
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
                controller: tecNumVerificacion,
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
                  onPressed: generaCodigoSMS,
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.amberAccent),
                  ),
                  child: Text(
                    "Enviar SMS",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                SizedBox(
                  width: 50,
                ),
                ElevatedButton(
                  onPressed: verificaCodigo,
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.amberAccent),
                  ),
                  child: Text(
                    "Aceptar",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

}