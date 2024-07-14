import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';


class OptionWidget extends StatelessWidget {
  final String option;
  final Color color;
  final ValueNotifier<String> selectedOption;
  final ValueChanged<String> onChanged;

  const OptionWidget({
    Key? key,
    required this.option,
    required this.color,
    required this.selectedOption,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<String>(
      valueListenable: selectedOption,
      builder: (context, value, child) {
        bool isSelected = value == option;
        return InkWell(
          onTap: isSelected
              ? null
              : () {
            onChanged(option);
          },
          child: Container(
            height: 40.h,
            width: 75.w,
            margin: const EdgeInsets.symmetric(horizontal: 5),
            decoration: BoxDecoration(
              color: isSelected ? color.withOpacity(0.5) : color,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text(
                option,
                style: Theme.of(context).textTheme.displayMedium?.copyWith(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}