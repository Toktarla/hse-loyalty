import 'package:flutter/material.dart';

class MenuItem extends StatelessWidget {
  final VoidCallback onTap;
  final String imagePath;
  final String text;
  final double imageWidth;
  final double imageHeight;
  final double heightBetweenImageAndText;
  final double textFontSize;

  const MenuItem(
      {Key? key,
      required this.onTap,
      required this.imagePath,
      required this.text,
      required this.imageWidth,
      required this.imageHeight,
      required this.heightBetweenImageAndText,
      required this.textFontSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
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
      child: InkWell(
        borderRadius: BorderRadius.circular(7),
        onTap: onTap,
        child: Column(
          children: [
            const SizedBox(height: 10,),
            Container(
              width: imageWidth,
              height: imageHeight,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  fit: BoxFit.contain,
                  image: AssetImage(
                    imagePath,
                  ),
                )
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
                  .copyWith(fontSize: textFontSize, fontWeight: FontWeight.normal),
            ),
            const SizedBox(height: 10,)
          ],
        ),
      ),
    );
  }
}
