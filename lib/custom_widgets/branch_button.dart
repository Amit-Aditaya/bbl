import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_babuland_app/custom_widgets/my_arch.dart';

class BranchButton extends StatelessWidget {
//  const BranchButton({Key? key}) : super(key: key);
  final String branchName;
  final Color buttonColor;

  const BranchButton(
      {Key? key, required this.branchName, required this.buttonColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(25),
      height: 150,
      width: 150,
      decoration: BoxDecoration(
          border: Border.all(width: 6, color: buttonColor),
          color: buttonColor,
          borderRadius: BorderRadius.circular(10)),
      child: Stack(
        children: [
          MyArc(text: branchName[0], color: buttonColor, diameter: 150),
          Center(
            child: Container(
              margin: const EdgeInsets.only(top: 60),
              child: Text(
                branchName,
                softWrap: false,
                overflow: TextOverflow.visible,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 26,
                    fontWeight: FontWeight.bold),
              ),
            ),
          )
        ],
      ),
    );
  }
}
