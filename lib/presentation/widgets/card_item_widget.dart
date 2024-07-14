import 'package:flutter/material.dart';

class CardItem extends StatelessWidget {
  final VoidCallback onTap;
  final String imagePath;
  final String text;
  final double imageWidth;
  final double imageHeight;
  final double heightBetweenImageAndText;
  final double textFontSize;
  final double height;
  final double width;

  const CardItem(
      {Key? key,
      required this.onTap,
      required this.imagePath,
      required this.text,
      required this.imageWidth,
      required this.imageHeight,
      required this.heightBetweenImageAndText,
      required this.textFontSize,
      required this.height,
      required this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(7),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              spreadRadius: 1,
              blurRadius: 3,
            )
          ],
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 10,
              ),
              child: Image.asset(
                imagePath,
                width: imageWidth,
                height: imageHeight,
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(
              height: heightBetweenImageAndText,
            ),
            Text(
              text,
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(fontSize: textFontSize),
            ),
          ],
        ),
      ),
    );
  }
}
