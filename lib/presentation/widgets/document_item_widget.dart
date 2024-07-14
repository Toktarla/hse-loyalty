import 'package:flutter/material.dart';
import 'package:hsg_loyalty/utils/constants/colors.dart';

class DocumentItem extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  final double heightBetweenImageAndText;
  final double textFontSize;

  const DocumentItem(
      {Key? key,
      required this.onTap,
      required this.text,
      required this.heightBetweenImageAndText,
      required this.textFontSize,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
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
              const Padding(
                padding: EdgeInsets.only(
                  top: 10,
                ),
                child: Icon(
                  Icons.folder,
                  size: 50,
                  color: AppColors.gray2,
                )
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
      )
    );
  }
}
