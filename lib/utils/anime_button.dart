import 'package:animated_button/animated_button.dart';
import 'package:create_your_adventure/utils/bordered_text_widget.dart';
import 'package:flutter/material.dart';

class AnimeButton extends StatelessWidget {
  const AnimeButton({
    @required this.onPressed,
    @required this.text,
    @required this.color,
  });

  final Color color;
  final Function onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedButton(
        width: MediaQuery.of(context).size.width - 50.0,
        color: color,
        child: BorderedTextWidget(
          text: text,
          fontSize: 20.0,
        ),
        onPressed: onPressed,
      ),
    );
  }
}
