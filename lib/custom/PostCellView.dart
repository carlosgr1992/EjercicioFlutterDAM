import 'package:flutter/material.dart';

class PostCellView extends StatelessWidget {
  final String sPost;
  final String sTitle;
  final int iColorCode;
  final double dFontSize;
  final int iPosicion;
  final VoidCallback? onTap; // Callback para manejar el toque

  PostCellView({
    Key? key,
    required this.sPost,
    required this.sTitle,
    required this.iColorCode,
    required this.dFontSize,
    this.onTap,
    required this.iPosicion,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap, // Asigna la función de callback al toque del título
          child: Text(
            sTitle,
            style: TextStyle(
              color: Colors.black,
              fontSize: dFontSize,
            ),
          ),
        ),
        GestureDetector(
          onTap: onTap, // Asigna la función de callback al toque del texto
          child: Text(
            sPost,
            style: TextStyle(
              color: Colors.lightBlueAccent[iColorCode],
              fontSize: dFontSize,
            ),
          ),
        ),
      ],
    );
  }
}
