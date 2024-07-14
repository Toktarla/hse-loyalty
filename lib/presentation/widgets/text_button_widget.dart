import 'package:flutter/material.dart';

class TextButtonWidget extends StatelessWidget {
  final double width;
  final double height;
  final String text;
  final VoidCallback onPressed;
  final Color color;
  final Color textColor;
  const TextButtonWidget({Key? key, required this.width, required this.height, required this.text, required this.onPressed, required this.color, required this.textColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(7),
      ),
      child: TextButton(

        onPressed: onPressed,
        child: Text(
          text,
          style: Theme.of(context).textTheme.displayLarge!.copyWith(color: textColor),
        ),

      ),
    );
  }
}
