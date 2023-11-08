import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class DrawerClass extends StatelessWidget{

  Function(int indice)? onItemTap;

  DrawerClass({Key? key,required this.onItemTap
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.lightBlueAccent,
            ),
            child: Text("Opciones",
                style: TextStyle(color: Colors.white),
            ),
          ),
          ListTile(
            leading: Icon(Icons.account_circle),
            selectedColor: Colors.blue,
            selected: true,
            title: Text("Login"),
            onTap: () {
              onItemTap!(0);
            },
          ),
          ListTile(
            leading: Icon(Icons.account_balance_wallet),
            title: Text("Salir"),
            onTap: () {
              onItemTap!(1);
            },
          ),
        ],
      ),
    );
  }

}