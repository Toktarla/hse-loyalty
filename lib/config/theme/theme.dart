import 'package:flutter/material.dart';
import '../../utils/constants/colors.dart';
import '../animation/route_animation/fade_in_transition.dart';

var theme = ThemeData(
  brightness: Brightness.light,
  primaryColor: AppColors.mainColor,
  fontFamily: 'Roboto',
  pageTransitionsTheme: const PageTransitionsTheme(
    builders: {
      TargetPlatform.android: FadePageTransitionsBuilder(),
      TargetPlatform.iOS: FadePageTransitionsBuilder(),
    },
  ),
  scaffoldBackgroundColor: AppColors.white,
  progressIndicatorTheme:
      const ProgressIndicatorThemeData(color: AppColors.mainColor),
  textTheme: const TextTheme(
    // Black
    displayLarge: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontSize: 20,
    ),
    displayMedium: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontSize: 16,
    ),
    displaySmall: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontSize: 12,
    ),
    titleLarge: TextStyle(
      color: Colors.black87,
      fontWeight: FontWeight.w500,
      fontSize: 20,
    ),
    titleMedium: TextStyle(
      color: Colors.black87,
      fontWeight: FontWeight.w500,
      fontSize: 16,
    ),
    titleSmall: TextStyle(
      color: Colors.black87,
      fontWeight: FontWeight.w700,
      fontSize: 12,
    ),

    // Grey
    bodyLarge: TextStyle(
        color: AppColors.gray2, fontSize: 20, fontWeight: FontWeight.w500),
    bodyMedium: TextStyle(
        color: AppColors.gray2, fontSize: 16, fontWeight: FontWeight.w500),
    bodySmall: TextStyle(
        color: AppColors.gray2, fontSize: 12, fontWeight: FontWeight.w500),
    labelLarge: TextStyle(
        color: AppColors.gray3, fontSize: 20, fontWeight: FontWeight.bold),
    labelMedium: TextStyle(
        color: AppColors.gray3, fontSize: 16, fontWeight: FontWeight.bold),
    labelSmall: TextStyle(
        color: AppColors.gray3, fontSize: 12, fontWeight: FontWeight.bold),

    // Some color
    headlineLarge: TextStyle(
        color: AppColors.mainColor, fontSize: 20, fontWeight: FontWeight.w700),
    headlineMedium: TextStyle(
        color: AppColors.mainColor, fontSize: 16, fontWeight: FontWeight.w700),
    headlineSmall: TextStyle(
        color: AppColors.mainColor, fontSize: 12, fontWeight: FontWeight.w700),
  ),
  appBarTheme: const AppBarTheme(
      color: AppColors.appBarColor,
      centerTitle: true,
      elevation: 0,
      scrolledUnderElevation: 0,
      titleTextStyle: TextStyle(
          color: AppColors.text_color,
          fontSize: 16,
          fontWeight: FontWeight.w600),
      iconTheme: IconThemeData(color: AppColors.text_color)),
  textSelectionTheme:
      const TextSelectionThemeData(cursorColor: AppColors.color_blue),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Colors.white,
    unselectedItemColor: AppColors.color_nav_inactive,
    selectedItemColor: AppColors.color_nav_active,
    unselectedLabelStyle: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 12,
        color: AppColors.color_nav_inactive),
    selectedLabelStyle: TextStyle(
        fontWeight: FontWeight.w600, fontSize: 12, color: AppColors.mainColor),
  ),
  primaryIconTheme: const IconThemeData(
    color: AppColors.gray3,
  ),
  radioTheme: RadioThemeData(
    fillColor: WidgetStateProperty.all<Color>(AppColors.color_blue2),
  ),
  dialogTheme: DialogTheme(
    backgroundColor: Colors.white,
    elevation: 4.0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8.0),
      // Rounded corners for the dialog
      side: BorderSide(color: Colors.grey.shade300), // Border side color
    ),
    titleTextStyle: const TextStyle(
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
      color: Colors.black87,
    ),
    // Title text style
    contentTextStyle: const TextStyle(
      fontSize: 16.0,
      color: Colors.black54,
    ), // Content text style
  ),
  bottomSheetTheme: BottomSheetThemeData(
    backgroundColor: Colors.white,
    elevation: 10.0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8.0),
      side: BorderSide(color: Colors.grey.shade300), // Border side color
    ),
  ),
  datePickerTheme: const DatePickerThemeData(
    backgroundColor: AppColors.white,
    elevation: 0,
  )
);
