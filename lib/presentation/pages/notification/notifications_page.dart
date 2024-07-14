import 'package:flutter/material.dart';
import 'package:hsg_loyalty/utils/constants/colors.dart';


class NotificationsPage extends StatelessWidget {
  const NotificationsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 40,
        title: Text(
          "Уведомления",
          style: Theme.of(context).textTheme.displayMedium,
        ),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Уведомления отсутсвуют",
              style: TextStyle(
                color: AppColors.gray,
                fontSize: 18,
                fontWeight: FontWeight.w400
              ),
            ),
          ],
        ),
      )
    );
  }
}
