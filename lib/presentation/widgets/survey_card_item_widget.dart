import 'package:flutter/material.dart';
import '../../utils/constants/colors.dart';

class SurveyItemCard extends StatelessWidget {
  final double width;
  final double height;
  final double trailingWidth;
  final double trailingHeight;
  final String title;
  final String date;
  final double forHostWidth;
  final double forHostHeight;
  final VoidCallback onTap;
  final bool forGuest;

  const SurveyItemCard(
      {Key? key,
      required this.width,
      required this.height,
      required this.trailingWidth,
      required this.trailingHeight,
      required this.title,
      required this.forHostWidth,
      required this.forHostHeight,
      required this.onTap,
      this.forGuest = true, required this.date})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, maxLines: 3, overflow: TextOverflow.ellipsis, ),
            Padding(
              padding: const EdgeInsets.only(top: 5, bottom: 10),
              child: Row(
                children: [
                  Text( date, style: Theme.of(context).textTheme.bodySmall, ),
                  const Spacer(),
                  SizedBox(
                    width: 100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: forGuest 
                                ? AppColors.color_green 
                                : Colors.lightBlueAccent,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                            child: FittedBox(
                              child: forGuest
                                ? Text(
                                "Для гостей",
                                style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: AppColors.white),
                              ) :Text(
                                "Для посетителей",
                                style: Theme.of(context).textTheme.bodySmall!.copyWith(color: AppColors.white),
                              ),
                            ),
                          ),
                        ),
                          
                        const SizedBox(width: 5),
                        const Icon(
                          Icons.arrow_forward_ios_outlined,
                          size: 18,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Divider(height: 0, color: AppColors.gray.withOpacity(0.2),)
          ]
        ),
      ),
    );
  }
}
