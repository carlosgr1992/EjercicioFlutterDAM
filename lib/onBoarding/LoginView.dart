import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {

  late BuildContext _context;

  @override
  Widget build(BuildContext context) {
    _context = context;

    return Scaffold(
      appBar: AppBar(title: Text("Login"), centerTitle: true, backgroundColor: Colors.amberAccent,),
      body: Column(
        children: [
          Text("Bienvenido al login",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.black
          )),
          TextField(
            decoration: InputDecoration(
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.amberAccent),
              ),
            ),
          ),
          TextFormField(
            decoration: InputDecoration(
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.amberAccent)
              ),
            ),
          ),
        ],
      ),
    );
  }


}