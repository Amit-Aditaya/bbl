import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_babuland_app/theme_helpers/shadows.dart';

class BranchCard extends StatelessWidget {
  //const BranchCard({Key? key}) : super(key: key);

  final String branchName;

  const BranchCard({Key? key, required this.branchName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
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
                'http://apps.babuland.org/bblapi/apiv2/apiv1/sheduled_img/1'),
          ),
        ),
        Text(
          branchName,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 20,
          ),
        ),
      ]),
    );
  }
}
