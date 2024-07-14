import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../presentation/cubits/bottom_bar_navigation_cubit.dart';

class DialogHelper {
  static void showAlert(BuildContext context) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Ошибка',
            style: Theme.of(context).textTheme.displayLarge
          ),
          content: Text(
              'Для просмотра данной страницы необходима авторизация',
            style: Theme.of(context).textTheme.titleMedium
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'ОТМЕНА',
                style: Theme.of(context).textTheme.headlineMedium
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);

                context.go("/authPage");
              },
              child: Text(
                'АВТОРИЗОВАТЬСЯ',
                style: Theme.of(context).textTheme.headlineMedium
              ),
            ),
          ],
        );
      },
    );
  }

  static void showSuccessAlert(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Column(
          children: [
            const Text('Вы заполнили карту'),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Close the modal bottom sheet
                Navigator.pop(context); // Go back to the previous page
              },
              child: const Text('Exit'),
            ),
          ],
        );
      },
    );
  }
}
