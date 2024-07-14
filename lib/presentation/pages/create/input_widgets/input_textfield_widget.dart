import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hsg_loyalty/domain/entity/create/create_qorgay_entity.dart';
import 'package:hsg_loyalty/presentation/cubits/create_qorgay_cubit.dart';
import 'package:hsg_loyalty/utils/constants/colors.dart';

class TextFieldInputPage extends StatelessWidget {
  final String hintText;
  final TextEditingController? textController;
  final bool isLoggedIn;
  final String? prefilledText;
  final int maxLines;
  final FocusNode? focusNode;
  final void Function(String)? onChanged;
  final int? authorId;

  const TextFieldInputPage({
    Key? key,
    required this.hintText,
    this.textController,
    required this.isLoggedIn,
    this.prefilledText,
    this.maxLines = 1,
    this.onChanged,
    this.focusNode,
    this.authorId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (isLoggedIn && prefilledText != null && textController?.text != prefilledText) {
      textController?.text = prefilledText!;
      BlocProvider.of<CreateQorgayCubit>(context).updateInput(
        CreateQorgayEntity(
          authorId:  authorId
        )
      );
    }

    return TextField(
      focusNode: focusNode,
      enableSuggestions: true,
      maxLines: maxLines,
      controller: textController,
      readOnly: isLoggedIn,
      decoration: InputDecoration(
        hintText: isLoggedIn ? prefilledText : hintText,
        hintStyle: Theme.of(context).textTheme.labelLarge,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(7),
          borderSide: const BorderSide(color: AppColors.textFieldBorderColor),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey), // Border color on focus
        ),
        filled: isLoggedIn,
        fillColor: isLoggedIn ? AppColors.textFieldFillColor : AppColors.transparent,
      ),
      onChanged: onChanged,
      style: isLoggedIn ? Theme.of(context).textTheme.displayLarge : Theme.of(context).textTheme.titleMedium, // Text color when read-only
      keyboardType: TextInputType.text,
      autocorrect: true,
      textAlignVertical: TextAlignVertical.center,
    );
  }
}

