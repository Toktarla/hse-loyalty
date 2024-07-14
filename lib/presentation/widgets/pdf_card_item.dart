import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PdfCardItem extends StatelessWidget {
  final String imagePath;
  final String text;
  final String link;
  final double imageWidth;
  final double imageHeight;
  final double fontSize;

  const PdfCardItem({
    Key? key,
    required this.imagePath,
    required this.text,
    required this.link, required this.imageWidth, required this.imageHeight, required this.fontSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          context.push(
            "/documentsScreen/documentsShowScreen/pdfViewScreen",
            extra: {
              "title": text,
              "pdfPath": "https://hse.kmg.kz$link"
            }
          );
        },
        child: ListTile(
          leading: Image.asset(
            imagePath,
            width: imageWidth,
            height: imageHeight,
          ),
          title: Text(text,maxLines: 2,style: Theme.of(context).textTheme.titleMedium!.copyWith(fontSize: fontSize),
          ),
        )
    );
  }
}
