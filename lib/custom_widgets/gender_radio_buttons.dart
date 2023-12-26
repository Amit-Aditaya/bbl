import 'package:flutter/material.dart';
import 'package:flutter_babuland_app/theme_helpers/colors.dart';

class GenderRadioButtons extends StatefulWidget {
  static RadioValue? currentValue;

  final RadioValue initialGender;
  const GenderRadioButtons({
    Key? key,
    required this.initialGender,
  }) : super(key: key);

  @override
  _GenderRadioButtonState createState() => _GenderRadioButtonState();
}

enum RadioValue { boy, girl }

class _GenderRadioButtonState extends State<GenderRadioButtons> {
  late RadioValue? _value = widget.initialGender;

  @override
  void initState() {
    GenderRadioButtons.currentValue = _value;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: double.infinity,
      color: Colors.transparent,
      padding: const EdgeInsets.all(.5),
      child: FittedBox(
        alignment: Alignment.centerLeft,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Radio<RadioValue>(
              fillColor: MaterialStateProperty.all(AppColors.primaryColor),
              value: RadioValue.boy,
              groupValue: _value,
              onChanged: (RadioValue? value) {
                setState(() {
                  _value = value;
                  //currentRadioValue = value;
                  GenderRadioButtons.currentValue = value;
                });
              },
            ),
            const SizedBox(width: 1),
            const Text('Male'),
            Radio<RadioValue>(
              fillColor: MaterialStateProperty.all(AppColors.primaryColor),
              value: RadioValue.girl,
              groupValue: _value,
              onChanged: (RadioValue? value) {
                setState(() {
                  _value = value;
                  GenderRadioButtons.currentValue = value;
                });
              },
            ),
            const SizedBox(width: 1),
            const Text('Female'),
          ],
        ),
      ),
    );
  }
}
