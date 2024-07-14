import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

mixin DateTimeMixin {

  String formatTime(TimeOfDay timeOfDay) {
    return '${timeOfDay.hour.toString().padLeft(2, '0')}:${timeOfDay.minute.toString().padLeft(2, '0')}';
  }


  String formatTimestamp(String timestamp) {

    if (timestamp.startsWith("/Date(") && timestamp.endsWith(")/")) {
      try {
        int milliseconds = int.parse(timestamp.substring(6, timestamp.length - 2));
        DateTime date = DateTime.fromMillisecondsSinceEpoch(milliseconds);
        date = DateTime(date.year, date.month, date.day);
        return DateFormat('dd-MM-yyyy').format(date);
      } catch (e) {
        print("Error parsing date: $e");
      }
    }
    return "Invalid Date";
  }


  String formatDate(DateTime dateTime) {
    const List<String> monthNames = [
      'января', 'февраля', 'марта', 'апреля', 'мая', 'июня',
      'июля', 'августа', 'сентября', 'октября', 'ноября', 'декабря'
    ];
    return '${dateTime.day.toString().padLeft(2, '0')} ${monthNames[dateTime.month - 1]} ${dateTime.year}г.';
  }
}