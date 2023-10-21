
import 'package:flutter/material.dart';

class ButtonMenu extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        TextButton(onPressed: null, child: Text("Lista"),),
        TextButton(onPressed: null, child: Text("Celdas"),)
      ],
    );
  }

}