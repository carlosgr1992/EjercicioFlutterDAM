import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PostCreateView extends StatelessWidget {
  final TextEditingController tecTitulo = TextEditingController();
  final TextEditingController tecCuerpo = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Nuevo Post"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: tecTitulo,
              decoration: InputDecoration(
                fillColor: Color(0xFFFFE6A5),
                filled: true,
                hintText: "Título",
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.amberAccent),
                ),
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: tecCuerpo,
              decoration: InputDecoration(
                fillColor: Color(0xFFFFE6A5),
                filled: true,
                hintText: "Introduzca cuerpo del post",
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.amberAccent),
                ),
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                String titulo = tecTitulo.text;
                String cuerpo = tecCuerpo.text;
                
              },
              child: Text("Postear"),
            ),
          ],
        ),
      ),
    );
  }
}
