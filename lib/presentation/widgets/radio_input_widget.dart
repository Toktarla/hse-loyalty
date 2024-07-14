import 'package:flutter/material.dart';
import 'package:hsg_loyalty/utils/constants/colors.dart';

class RadioInputWidget extends StatefulWidget {
  final List<String> options;
  final void Function(int)? onChanged;
  final int? selectedOption;

  RadioInputWidget({
    required this.options,
    required this.onChanged,
    required this.selectedOption,
  });

  @override
  _RadioInputWidgetState createState() => _RadioInputWidgetState();
}

class _RadioInputWidgetState extends State<RadioInputWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.options.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            widget.onChanged?.call(index);
          },
          child: Row(
            children: [
              Radio(
                value: index,
                groupValue: widget.selectedOption,
                onChanged: (int? value) {
                  widget.onChanged?.call(value!);
                },
                activeColor: AppColors.mainColor,
              ),
              Text(
                widget.options[index],
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        );
      },
    );
  }
}
