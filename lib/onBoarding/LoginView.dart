import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {

  late BuildContext _context;

  @override
  Widget build(BuildContext context) {
    _context = context;

    return Scaffold(
      appBar: AppBar(title: Text("Login"), centerTitle: true),
      body: Column(children: [
        Text("Bienvenido al login"),
        TextField(),
        TextFormField()
      ]),
    );
  }


}