import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../utils/constants/colors.dart';

class VisitReportCard extends StatelessWidget {
  final double height;
  final double width;
  final String date;
  final String title;
  final String company;
  final VoidCallback onDelete;
  final VoidCallback onTap;

  const VisitReportCard({
    Key? key,
    required this.height,
    required this.width,
    required this.date,
    required this.title,
    required this.company,
    required this.onDelete,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: const LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              AppColors.color_quest_special,
              Color.fromRGBO(15, 62, 206, 1.0),
              Color.fromRGBO(49, 72, 165, 1)
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    'Отчет',
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(color: AppColors.white),
                  ),
                  const Spacer(),
                  Text(
                    date,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(color: AppColors.white),
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete, color: AppColors.white),
                    onPressed: onDelete,
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      title,
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(color: AppColors.white),
                      overflow: TextOverflow.ellipsis, // add this to handle long text with ellipsis
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10,),
              Row(
                children: [
                  const Icon(Icons.gps_fixed, color: AppColors.white, size: 20),
                  const SizedBox(width: 5),
                  Expanded(
                    child: Text(
                      company,
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(color: AppColors.white),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
