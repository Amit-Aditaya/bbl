import 'package:flutter/material.dart';
import 'package:flutter_babuland_app/data/model/children_model.dart';

class ChildMembershipDropdownButton extends StatefulWidget {
  //const ChildMembershipDropdownButton({Key? key}) : super(key: key);
  final ChildrenModel childrenModel;
  const ChildMembershipDropdownButton({
    Key? key,
    required this.childrenModel,
  }) : super(key: key);

  @override
  State<ChildMembershipDropdownButton> createState() =>
      _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<ChildMembershipDropdownButton> {
  String dropdownValue = 'One';
  //late String dropdownValue;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String? newValue) {
        setState(() {
          dropdownValue = newValue!;
        });
      },
      items: <String>['One', 'Two', 'Free', 'Four']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
