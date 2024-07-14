import 'package:flutter/material.dart';

class SnackBarHelper {
  static final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

  static void showSnackbar({
    required String message,
    Duration duration = const Duration(seconds: 1),
    SnackBarAction? action,
    Color backgroundColor = Colors.black,
  }) {
    scaffoldMessengerKey.currentState?.showSnackBar(
      SnackBar(
        content: Text(message),
        duration: duration,
        action: action,
        backgroundColor: backgroundColor,
      ),
    );
  }

  static void showErrorSnackbar({
    required String message,
    Duration duration = const Duration(seconds: 1),
    SnackBarAction? action,
  }) {
    showSnackbar(
      message: message,
      duration: duration,
      action: action,
      backgroundColor: Color.fromRGBO(108, 14, 14,1),
    );
  }

  static void clearSnackbars() {
    scaffoldMessengerKey.currentState?.clearSnackBars();
  }

  static void showSuccessSnackbar({
    required String message,
    Duration duration = const Duration(seconds: 1),
    SnackBarAction? action,
  }) {
    showSnackbar(
      message: message,
      duration: duration,
      action: action,
      backgroundColor: Color.fromRGBO(18, 107, 25,1),
    );
  }
}
