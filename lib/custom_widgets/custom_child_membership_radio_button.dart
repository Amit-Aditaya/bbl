import 'package:flutter/material.dart';
import 'package:flutter_babuland_app/custom_classes/child_membership_radio_button_item.dart';
import 'package:flutter_babuland_app/custom_classes/temp_child_name_holder.dart';
import 'package:flutter_babuland_app/data/model/children_model.dart';

class CustomChildMembershipRadioButton extends StatefulWidget {
  ChildrenModel childrenModel;

  CustomChildMembershipRadioButton({
    Key? key,
    required this.childrenModel,
  }) : super(key: key);

  @override
  State<CustomChildMembershipRadioButton> createState() =>
      _CustomChildMembershipRadioButtonState();
}

class _CustomChildMembershipRadioButtonState
    extends State<CustomChildMembershipRadioButton> {
  List<CustomChildMembershipRadioButtonItem> childList = [];

  @override
  void initState() {
    for (int i = 0; i < widget.childrenModel.items.length; i++) {
      childList.add(CustomChildMembershipRadioButtonItem(
          widget.childrenModel.items[i].childId,
          widget.childrenModel.items[i].childName,
          false));
    }
    childList[0].isActive = true;
    TempChildNameHolder.childName = childList[0].text;
    TempChildNameHolder.childId = childList[0].id;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: ListView.builder(
          physics: childList.length > 5
              ? const ClampingScrollPhysics()
              : const NeverScrollableScrollPhysics(),
          itemCount: childList.length,
          itemBuilder: (context, index) {
            return InkWell(
              splashColor: Colors.transparent,
              splashFactory: NoSplash.splashFactory,
              onTap: () {
                setState(() {
                  childList.forEach((element) {
                    element.isActive = false;
                  });
                  childList[index].isActive = true;
                  TempChildNameHolder.childName = childList[index].text;
                  TempChildNameHolder.childId = childList[index].id;
                });
              },
              child: CustomChildMembershipRadioButtonItem(
                childList[index].id,
                childList[index].text,
                childList[index].isActive,
              ),
            );
          }),
    );
  }
}
