import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class AppBorder extends StatelessWidget {
  const AppBorder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 4,
      width: double.infinity,
      child: Row(children: [
        Expanded(
          flex: 3,
          child: Container(
            color: Colors.green,
          ),
        ),
        Expanded(
          flex: 4,
          child: Container(
            color: Colors.orange,
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            color: Colors.pink,
          ),
        ),
        Expanded(
          flex: 2,
          child: Container(
            color: Colors.lightBlue,
          ),
        ),
      ]),
    );
  }
}
