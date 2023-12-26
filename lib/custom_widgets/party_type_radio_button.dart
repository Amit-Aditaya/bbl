import 'package:flutter/material.dart';
import 'package:flutter_babuland_app/theme_helpers/colors.dart';

class PartyTypeRadioButton extends StatefulWidget {
  static PartyTypeRadioValue? currentValue;

  final PartyTypeRadioValue initialPartyType;
  const PartyTypeRadioButton({
    Key? key,
    required this.initialPartyType,
  }) : super(key: key);

  @override
  _PartyTypeRadioButtonState createState() => _PartyTypeRadioButtonState();
}

enum PartyTypeRadioValue { classParty, birthdayParty, getTogether }

class _PartyTypeRadioButtonState extends State<PartyTypeRadioButton> {
  late PartyTypeRadioValue? _value = widget.initialPartyType;
  @override
  void initState() {
    PartyTypeRadioButton.currentValue = _value;
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
            Radio<PartyTypeRadioValue>(
              fillColor: MaterialStateProperty.all(AppColors.primaryColor),
              value: PartyTypeRadioValue.classParty,
              groupValue: _value,
              onChanged: (PartyTypeRadioValue? value) {
                setState(() {
                  _value = value;
                  PartyTypeRadioButton.currentValue = value;
                });
              },
            ),
            //const SizedBox(width: 1),
            const Text(
              'Class Party',
            ),
            Radio<PartyTypeRadioValue>(
              fillColor: MaterialStateProperty.all(AppColors.primaryColor),
              value: PartyTypeRadioValue.birthdayParty,
              groupValue: _value,
              onChanged: (PartyTypeRadioValue? value) {
                setState(() {
                  _value = value;
                  PartyTypeRadioButton.currentValue = value;
                });
              },
            ),
            //const SizedBox(width: 1),
            const Text(
              'Birthday Party',
            ),
            Radio<PartyTypeRadioValue>(
              fillColor: MaterialStateProperty.all(AppColors.primaryColor),
              value: PartyTypeRadioValue.getTogether,
              groupValue: _value,
              onChanged: (PartyTypeRadioValue? value) {
                setState(() {
                  _value = value;
                  PartyTypeRadioButton.currentValue = value;
                });
              },
            ),
            // const SizedBox(width: 1),
            const Text(
              'Get Together',
            ),
          ],
        ),
      ),
    );
  }
}
