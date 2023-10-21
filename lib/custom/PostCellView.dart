
import 'package:flutter/material.dart';



class PostCellView extends StatelessWidget{

  final String sPost;
  final String sTitle;
  final int iColorCode;
  final double dFontSize;

  PostCellView({
    Key? key,
    required this.sPost,
    required this.sTitle,
    required this.iColorCode,
    required this.dFontSize,
  }) : super(key: key);

 /* @override
  Widget build(BuildContext context) {
    return Text(sPost,
      style: TextStyle(
          color: Colors.amber[iColorCode],
          fontSize: dFontSize),);
    }*/

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(sTitle,
        style: TextStyle(
          color: Colors.amber[iColorCode],
          fontSize: dFontSize
        ),),
        Text(sPost,
          style: TextStyle(
              color: Colors.amber[iColorCode],
              fontSize: dFontSize
          ),)
      ],
    );
   }
  }