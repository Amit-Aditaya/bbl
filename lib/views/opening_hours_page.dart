import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_babuland_app/custom_widgets/branch_card.dart';
import 'package:flutter_babuland_app/custom_widgets/custom_app_bar.dart';
import 'package:flutter_babuland_app/main.dart';
import 'package:flutter_babuland_app/theme_helpers/shadows.dart';

class OpeningHoursPage extends StatelessWidget {
  const OpeningHoursPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Opening Hours',
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(children: [
          InkWell(
              onTap: () {
                // Navigator.pushNamed(context, 'branchHoursPage',
                //     arguments: const BranchHoursPage(
                //         branchCard: BranchCard(
                //       branchName: 'Mirpur',
                //     )));
              },
              child: BranchCard(
                branchName: 'Mirpur',
              )),
          BranchCard(
            branchName: 'Uttara',
          ),
          BranchCard(
            branchName: 'Badda',
          ),
          BranchCard(
            branchName: 'Wari',
          ),
        ]),
      ),
    );
  }
}
