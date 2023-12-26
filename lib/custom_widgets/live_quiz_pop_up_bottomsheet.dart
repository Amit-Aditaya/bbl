import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_babuland_app/custom_widgets/live_quiz_asnwer_container.dart';
import 'package:flutter_babuland_app/theme_helpers/colors.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LiveQuizPopUpBottomSheet extends StatelessWidget {
  late String correctAnswer;
  late List answers = [];

  Color answerContainerColor = Colors.white;

  final int popupQuestionId;
  final String date;
  final String customerPhoneNumber;
  final String? customerName;
  LiveQuizPopUpBottomSheet(
      {Key? key,
      required this.popupQuestionId,
      required this.date,
      required this.customerName,
      required this.customerPhoneNumber})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    DatabaseReference db = FirebaseDatabase.instance
        .ref()
        .child('live_quizzes')
        .child(date)
        .child(popupQuestionId.toString());

    return Container(
      height: MediaQuery.of(context).size.height * .3,
      width: double.infinity,
      child: FutureBuilder(
        future: db.once(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            correctAnswer =
                (snapshot.data as dynamic).snapshot.children.elementAt(1).value;

            answers.add((snapshot.data as dynamic)
                .snapshot
                .children
                .elementAt(3)
                .value);
            answers.add((snapshot.data as dynamic)
                .snapshot
                .children
                .elementAt(4)
                .value);
            answers.add((snapshot.data as dynamic)
                .snapshot
                .children
                .elementAt(5)
                .value);
            answers.add((snapshot.data as dynamic)
                .snapshot
                .children
                .elementAt(6)
                .value);

            return SizedBox(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const SizedBox(height: 7.5),
                    Text(
                      'Q. ${(snapshot.data as dynamic).snapshot.children.elementAt(7).value}',
                      style: TextStyle(
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 16),
                    ),
                    const SizedBox(height: 7.5),
                    Column(
                      children: List.generate(answers.length, (index) {
                        return LiveQuizAnswerContainer(
                          customerName: customerName,
                          popupQuestionId: popupQuestionId,
                          customerPhoneNumber: customerPhoneNumber,
                          correctAnswer: correctAnswer,
                          text: answers[index],
                          isCorrect: false,
                        );
                      }),
                    ),
                    const SizedBox(height: 7.5),
                  ],
                ),
              ),
            );
          } else {
            return Center(
                child: SpinKitChasingDots(
              color: AppColors.primaryColor,
            ));
          }
        },
      ),
    );
  }
}
