import 'package:flutter/material.dart';
import 'package:flutter_babuland_app/theme_helpers/colors.dart';

class BranchesRadioButtons extends StatefulWidget {
  static BranchRadioValue? currentValue;
  final BranchRadioValue initialBranch;

  const BranchesRadioButtons({
    Key? key,
    required this.initialBranch,
  }) : super(key: key);

  @override
  _BranchesRadioButtonState createState() => _BranchesRadioButtonState();
}

enum BranchRadioValue { mirpur, uttara, wari, badda }

class _BranchesRadioButtonState extends State<BranchesRadioButtons> {
  late BranchRadioValue? _value = widget.initialBranch;

  @override
  void initState() {
    BranchesRadioButtons.currentValue = _value;
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
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Radio<BranchRadioValue>(
              fillColor: MaterialStateProperty.all(AppColors.primaryColor),
              value: BranchRadioValue.mirpur,
              groupValue: _value,
              onChanged: (BranchRadioValue? value) {
                setState(() {
                  _value = value;
                  BranchesRadioButtons.currentValue = value;
                });
              },
            ),
            const SizedBox(width: 1),
            const Text('Mirpur'),
            Radio<BranchRadioValue>(
              fillColor: MaterialStateProperty.all(AppColors.primaryColor),
              value: BranchRadioValue.uttara,
              groupValue: _value,
              onChanged: (BranchRadioValue? value) {
                setState(() {
                  _value = value;
                  BranchesRadioButtons.currentValue = value;
                });
              },
            ),
            const SizedBox(width: 1),
            const Text('Uttara'),
            const SizedBox(width: 2),
            Radio<BranchRadioValue>(
              fillColor: MaterialStateProperty.all(AppColors.primaryColor),
              value: BranchRadioValue.wari,
              groupValue: _value,
              onChanged: (BranchRadioValue? value) {
                setState(() {
                  _value = value;
                  BranchesRadioButtons.currentValue = value;
                });
              },
            ),
            const SizedBox(width: 1),
            const Text('Wari'),
            Radio<BranchRadioValue>(
              fillColor: MaterialStateProperty.all(AppColors.primaryColor),
              value: BranchRadioValue.badda,
              groupValue: _value,
              onChanged: (BranchRadioValue? value) {
                setState(() {
                  _value = value;
                  BranchesRadioButtons.currentValue = value;
                });
              },
            ),
            const SizedBox(width: 1),
            const Text('Badda'),
          ],
        ),
      ),
    );
  }
}
