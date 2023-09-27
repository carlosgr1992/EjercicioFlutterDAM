

import 'package:flutter/material.dart';

class RegisterView extends StatelessWidget{

  late BuildContext _context;

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
              decoration: InputDecoration(
                hintText: "Usuario",
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
              decoration: InputDecoration(
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
              decoration: InputDecoration(
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
              SizedBox(height: 80,),
              TextButton(onPressed: null,
                style: ButtonStyle(
                    side: MaterialStateProperty.all(BorderSide(color: Colors.amberAccent))
                ),
                child: Text("Registrarme",
                  style: TextStyle(
                      color: Colors.black
                  ),),),
              SizedBox(width: 50,),
              TextButton(onPressed: onClickCancelar,
                  style: ButtonStyle(
                      side: MaterialStateProperty.all(BorderSide(color: Colors.amberAccent))
                  ),
                  child: Text("Cancelar",
                    style: TextStyle(color: Colors.black),))
            ],
          )
        ],
      ),
    );
  }

  void onClickCancelar(){

    Navigator.of(_context).pushNamed("/loginView");
  }

}