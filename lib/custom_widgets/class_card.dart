import 'package:flutter/material.dart';
import 'package:flutter_babuland_app/theme_helpers/shadows.dart';

class ClassCard extends StatelessWidget {
  //const ClassCard({Key? key}) : super(key: key);
  final String className;
  final int classId;
  const ClassCard({
    Key? key,
    required this.className,
    required this.classId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      margin: const EdgeInsets.symmetric(vertical: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [AppShadows.buttonShadow],
      ),
      child: Column(children: [
        Container(
          height: 150,
          margin: const EdgeInsets.symmetric(
            horizontal: 25,
            vertical: 15,
          ),
          child: Image(
            image: NetworkImage(
                'http://apps.babuland.org/bblapi/apiv2/apiv1/sheduled_img/$classId'),
          ),
        ),
        Text(
          className,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 20,
          ),
        ),
      ]),
    );
  }
}
