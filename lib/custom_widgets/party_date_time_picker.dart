import 'package:flutter/material.dart';
import 'package:flutter_babuland_app/theme_helpers/colors.dart';
import 'package:intl/intl.dart';

class PartyDateTimePicker extends StatefulWidget {
  const PartyDateTimePicker({Key? key}) : super(key: key);

  static String? userSelectedDate;
  static String? userSelectedTime;

  @override
  State<PartyDateTimePicker> createState() => _PartyDateTimePickerState();
}

class _PartyDateTimePickerState extends State<PartyDateTimePicker> {
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();

  String date = 'Date';
  String time = 'Time';

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              InkWell(
                onTap: () {
                  _selectDate(context);
                },
                child: Icon(
                  Icons.date_range_outlined,
                  size: 50,
                  color: AppColors.primaryBlue,
                ),
              ),
              const SizedBox(height: 7.5),
              Text(
                date,
                style: const TextStyle(fontSize: 15),
              ),
            ],
          ),
          Column(
            children: [
              InkWell(
                onTap: () {
                  _selectTime(context);
                },
                child: Icon(
                  Icons.alarm,
                  size: 50,
                  color: AppColors.primaryBlue,
                ),
              ),
              const SizedBox(height: 7.5),
              Text(
                time,
                style: const TextStyle(fontSize: 15),
              ),
            ],
          ),
        ],
      ),
    );
  }

  _selectDate(BuildContext context) async {
    final DateTime? selected = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2010),
      lastDate: DateTime(2025),
    );
    if (selected != null && selected != selectedDate) {
      setState(() {
        selectedDate = selected;
        DateFormat dateFormat = DateFormat('dd-MM-yyyy');
        date = dateFormat.format(selectedDate);
        PartyDateTimePicker.userSelectedDate = date;
      });
    }
  }

  _selectTime(BuildContext context) async {
    final TimeOfDay? timeOfDay = await showTimePicker(
      context: context,
      initialTime: selectedTime,
      initialEntryMode: TimePickerEntryMode.dial,
    );
    if (timeOfDay != null && timeOfDay != selectedTime) {
      setState(() {
        selectedTime = timeOfDay;
        time = selectedTime.format(context);
        PartyDateTimePicker.userSelectedTime = time;
      });
    }
  }
}
