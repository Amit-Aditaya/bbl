import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_babuland_app/custom_widgets/live_quiz_pop_up_bottomsheet.dart';
import 'package:flutter_babuland_app/theme_helpers/colors.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';

class LiveQuizBottomSheetStream extends StatelessWidget {
  final String customerPhoneNumber;
  final String customerName;
  LiveQuizBottomSheetStream({
    Key? key,
    required this.customerPhoneNumber,
    required this.customerName,
  }) : super(key: key);

  DatabaseReference quizPopupDB =
      FirebaseDatabase.instance.ref().child('quiz_pop_up');
  DatabaseReference quizParticipationDB =
      FirebaseDatabase.instance.ref().child('quiz_participation');
  String dateFormat = DateFormat('yyyy_MMM_dd').format(DateTime.now());
  bool shouldPopup = false;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Object>(
        stream: quizPopupDB.onValue,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if ((snapshot.data as dynamic)
                    .snapshot
                    .children
                    .elementAt(1)
                    .value ==
                'Y') {
              return FutureBuilder(
                  future: quizParticipationDB.child(dateFormat).get(),
                  builder: (context, futureSnapshot) {
                    if (futureSnapshot.hasData &&
                        (futureSnapshot.data as dynamic).hasChild(
                                (snapshot.data as dynamic)
                                    .snapshot
                                    .children
                                    .elementAt(0)
                                    .value
                                    .toString()) ==
                            false) {
                      return LiveQuizPopUpBottomSheet(
                          customerName: customerName,
                          customerPhoneNumber: customerPhoneNumber,
                          date: dateFormat,
                          popupQuestionId: (snapshot.data as dynamic)
                              .snapshot
                              .children
                              .elementAt(0)
                              .value);
                    } else if (futureSnapshot.hasData &&
                        (futureSnapshot.data as dynamic).hasChild(
                            (snapshot.data as dynamic)
                                .snapshot
                                .children
                                .elementAt(0)
                                .value
                                .toString()) &&
                        (futureSnapshot.data as dynamic)
                                .child((snapshot.data as dynamic)
                                    .snapshot
                                    .children
                                    .elementAt(0)
                                    .value
                                    .toString())
                                .hasChild(customerPhoneNumber) ==
                            false) {
                      return LiveQuizPopUpBottomSheet(
                          customerName: customerName,
                          customerPhoneNumber: customerPhoneNumber,
                          date: dateFormat,
                          popupQuestionId: (snapshot.data as dynamic)
                              .snapshot
                              .children
                              .elementAt(0)
                              .value);
                    } else {
                      return const SizedBox(
                        height: 1,
                      );
                    }
                  });
            } else {
              return const SizedBox(
                height: 1,
              );
            }
          } else {
            return Center(
              child: SpinKitWave(color: AppColors.primaryColor),
            );
          }
        });
  }
}
