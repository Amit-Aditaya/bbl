import 'package:flutter/material.dart';
import 'package:flutter_babuland_app/theme_helpers/colors.dart';

class YesNoradioButton extends StatefulWidget {
  static YesNoRadioValue? currentValue;

  final YesNoRadioValue initialYesNoValue;
  const YesNoradioButton({
    Key? key,
    required this.initialYesNoValue,
  }) : super(key: key);

  @override
  _YesNoradioButtonState createState() => _YesNoradioButtonState();
}

enum YesNoRadioValue { yes, no }

class _YesNoradioButtonState extends State<YesNoradioButton> {
  late YesNoRadioValue? _value = widget.initialYesNoValue;
  @override
  void initState() {
    YesNoradioButton.currentValue = _value;
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
            Radio<YesNoRadioValue>(
              fillColor: MaterialStateProperty.all(AppColors.primaryColor),
              value: YesNoRadioValue.yes,
              groupValue: _value,
              onChanged: (YesNoRadioValue? value) {
                setState(() {
                  _value = value;
                  YesNoradioButton.currentValue = value;
                });
              },
            ),
            const SizedBox(width: 1),
            const Text('Yes'),
            const SizedBox(width: 25),
            Radio<YesNoRadioValue>(
              fillColor: MaterialStateProperty.all(AppColors.primaryColor),
              value: YesNoRadioValue.no,
              groupValue: _value,
              onChanged: (YesNoRadioValue? value) {
                setState(() {
                  _value = value;
                  YesNoradioButton.currentValue = value;
                });
              },
            ),
            const SizedBox(width: 1),
            const Text('No'),
          ],
        ),
      ),
    );
  }
}
