
import 'package:flutter/material.dart';

class ButtonMenu extends StatelessWidget{

  Function(int indice)? evento;

  ButtonMenu({Key? key, required this.evento
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        TextButton(onPressed: () => evento!(0), child: Icon(Icons.grid_view)),
        TextButton(onPressed: () => evento!(1), child: Icon(Icons.list),)
      ],
    );
  }

}