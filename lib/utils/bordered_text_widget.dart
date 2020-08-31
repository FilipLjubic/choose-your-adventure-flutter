import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';

class BorderedTextWidget extends StatelessWidget {
  final String text;
  final double fontSize;

  const BorderedTextWidget({this.text, this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 16.0),
      child: BorderedText(
        strokeWidth: 6.0,
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: fontSize,
          ),
        ),
      ),
    );
  }
}
