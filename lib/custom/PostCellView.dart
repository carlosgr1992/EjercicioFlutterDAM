import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PostCellView extends StatelessWidget {
  final String sPost;
  final String sTitle;
  final int iColorCode;
  final double dFontSize;
  final int iPosicion;
  final Function(int indice) onTapClicked;

  const PostCellView({
    Key? key,
    required this.sPost,
    required this.sTitle,
    required this.iColorCode,
    required this.dFontSize,
    required this.iPosicion,
    required this.onTapClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () => onTapClicked(iPosicion), // Corrige la llamada a onTapClicked
          child: Text(
            sTitle,
            style: TextStyle(
              color: Colors.black,
              fontSize: dFontSize,
            ),
          ),
        ),
        GestureDetector(
          onTap: () => onTapClicked(iPosicion), // Corrige la llamada a onTapClicked
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
