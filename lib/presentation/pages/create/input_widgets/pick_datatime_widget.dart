import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hsg_loyalty/utils/constants/colors.dart';
import 'package:hsg_loyalty/utils/mixins/date_time_mixin.dart';
import 'package:intl/intl.dart';  // Make sure to import intl package for formatting

import '../../../../domain/entity/create/create_qorgay_entity.dart';
import '../../../cubits/create_qorgay_cubit.dart';

class PickDateTimeWidget extends StatefulWidget {
  final Function({String? incidentDateTime,String? date, String? time}) changeState;

  const PickDateTimeWidget({super.key, required this.changeState});

  @override
  State<PickDateTimeWidget> createState() => _PickDateTimeWidgetState();
}

class _PickDateTimeWidgetState extends State<PickDateTimeWidget> with DateTimeMixin {
  DateTime _selectedDate = DateTime.now();
  TimeOfDay _selectedTime = TimeOfDay.now();

  @override
  void initState() {
    super.initState();
    _updateIncidentDateTime();
  }

  void _updateIncidentDateTime() {
    final DateTime combinedDateTime = DateTime(
      _selectedDate.year,
      _selectedDate.month,
      _selectedDate.day,
      _selectedTime.hour,
      _selectedTime.minute,
    );

    final String formattedDateTime = combinedDateTime.toIso8601String();
    widget.changeState(
        time: DateTime(
          _selectedTime.hour,
          _selectedTime.minute,
        ).toIso8601String(),
        date: DateTime(
          _selectedDate.year,
          _selectedDate.month,
          _selectedDate.day,
        ).toIso8601String(),
        incidentDateTime: combinedDateTime.toIso8601String());
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );

    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
      _updateIncidentDateTime();
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
      builder: (BuildContext context, Widget? child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
          child: child!,
        );
      },
    );

    if (picked != null && picked != _selectedTime) {
      setState(() {
        _selectedTime = picked;
      });
      _updateIncidentDateTime();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          height: 50,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColors.gray3.withOpacity(0.5),
          ),
          child: GestureDetector(
            onTap: () {
              _selectDate(context);
            },
            child: Center(
              child: Text(
                formatDate(_selectedDate),
                style: Theme.of(context).textTheme.displayLarge,
              ),
            ),
          ),
        ),
        const SizedBox(width: 10),
        Container(
          height: 50,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColors.gray3.withOpacity(0.5),
          ),
          child: GestureDetector(
            onTap: () {
              _selectTime(context);
            },
            child: Center(
              child: Text(
                formatTime(_selectedTime),
                style: Theme.of(context).textTheme.displayLarge,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
