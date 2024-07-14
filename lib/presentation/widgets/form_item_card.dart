import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../utils/constants/colors.dart';

class FormItemCard extends StatelessWidget {
  final int numeration;
  final String title;
  final Widget action;

  const FormItemCard({
    super.key,
    required this.numeration,
    required this.title,
    required this.action,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: [
              Text(
                numeration.toString(),
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: AppColors.mainColor.withOpacity(0.2),
                ),
              ),
              const SizedBox(width: 30),
              Expanded(
                child: Text(
                  title,
                  maxLines: 5,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
            ],
          ),
          Divider(
            color: AppColors.color_quest_guest,
            height: 5.h,
            thickness: 2,
          ),
          Divider(
            color: AppColors.gray,
            height: 10.h,
            thickness: 1,
          ),
          const SizedBox(height: 10),
          action,
          const SizedBox(height: 10),
          Divider(
            color: AppColors.gray,
            height: 10.h,
            thickness: 1,
          ),
        ],
      ),
    );
  }
}
