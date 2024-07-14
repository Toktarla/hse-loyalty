import 'package:flutter/material.dart';
import 'package:hsg_loyalty/utils/constants/colors.dart';

class RoundedTextField extends StatelessWidget {
  final String hintText;
  final bool isPassword;
  final TextEditingController controller;
  final FocusNode focusNode;

  const RoundedTextField({super.key, required this.hintText, required this.isPassword, required this.controller, required this.focusNode});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        border: Border.all(color: Colors.grey.withOpacity(0.3)),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 1,
          )
        ],
      ),
      child: TextField(
        focusNode: focusNode,
        controller: controller,
        obscureText: isPassword,
        style: const TextStyle(color: AppColors.black, fontWeight: FontWeight.w400),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.zero,
          hintText: hintText,
          border: InputBorder.none,
          hintStyle: const TextStyle(fontSize: 22, fontWeight: FontWeight.w400)
        ),
      ),
    );
  }
}