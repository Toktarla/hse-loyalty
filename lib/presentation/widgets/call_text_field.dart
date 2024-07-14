import 'package:flutter/material.dart';
import 'package:hsg_loyalty/utils/constants/colors.dart';



class CallTextField extends StatelessWidget {
  final VoidCallback onTap;
  final double height;
  final double width;
  final String text;

  const CallTextField({Key? key, required this.onTap, required this.height, required this.width, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              spreadRadius: 1.5,
              blurRadius: 3,
              offset: Offset(0, 2)
            )
          ],
        ),
        child: Center(
          child: Text(
            text, 
            style: const TextStyle(
              color: AppColors.mainColor,
              fontSize: 20,
              fontWeight: FontWeight.w400
            ),
          ),
        ),
      ),
    );

  }
}
