import 'package:flutter/material.dart';
import 'package:flutter_babuland_app/theme_helpers/colors.dart';
import 'package:flutter_babuland_app/views/add_child_page.dart';
import 'package:intl/intl.dart';

class DateOfBirthPicker extends StatefulWidget {
  const DateOfBirthPicker({Key? key}) : super(key: key);

  @override
  State<DateOfBirthPicker> createState() => _DateOfBirthPickerState();
}

class _DateOfBirthPickerState extends State<DateOfBirthPicker> {
  DateTime selectedDate = DateTime.now();
  String? date;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Text(
              //   date,
              //   style: TextStyle(fontSize: 15, color: AppColors.primaryPurple),
              // ),
              date == null
                  ? const SizedBox(
                      height: 1,
                    )
                  : Text(
                      date!,
                      style: TextStyle(
                          fontSize: 15,
                          color: AppColors.primaryPurple,
                          fontWeight: FontWeight.w500),
                    ),

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
            ],
          ),
          const SizedBox(width: 25),
        ],
      ),
    );
  }

  _selectDate(BuildContext context) async {
    final DateTime? selected = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2005),
      lastDate: DateTime.now(),
    );
    if (selected != null && selected != selectedDate) {
      setState(() {
        selectedDate = selected;
        DateFormat dateFormat = DateFormat('MM/dd/yyyy');
        date = dateFormat.format(selectedDate);
        AddChildPage.dateString = date;
      });
    }
  }
}
