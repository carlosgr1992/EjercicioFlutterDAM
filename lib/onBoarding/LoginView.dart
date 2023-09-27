import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {

  late BuildContext _context;

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
              decoration: InputDecoration(
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
              decoration: InputDecoration(
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
              TextButton(onPressed: null,
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

  void onClickRegistrar(){

      Navigator.of(_context).pushNamed("/registerView");

  }

}