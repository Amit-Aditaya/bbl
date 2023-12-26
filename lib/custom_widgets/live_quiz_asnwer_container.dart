import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_babuland_app/theme_helpers/colors.dart';
import 'package:intl/intl.dart';

class LiveQuizAnswerContainer extends StatefulWidget {
  // const LiveQuizAnswerContainer({Key? key}) : super(key: key);
  int popupQuestionId;
  String dateFormat = DateFormat('yyyy_MMM_dd').format(DateTime.now());

  DatabaseReference tequizParticipationDBst =
      FirebaseDatabase.instance.ref().child('quiz_participation');
  bool isWrong = false;
  String correctAnswer;
  String text;
  bool isCorrect;
  String customerPhoneNumber;
  String? customerName;
  LiveQuizAnswerContainer(
      {Key? key,
      required this.correctAnswer,
      required this.popupQuestionId,
      required this.text,
      required this.isCorrect,
      required this.customerName,
      required this.customerPhoneNumber})
      : super(key: key);

  @override
  State<LiveQuizAnswerContainer> createState() =>
      _LiveQuizAnswerContainerState();
}

class _LiveQuizAnswerContainerState extends State<LiveQuizAnswerContainer> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (widget.text == widget.correctAnswer) {
          setState(() {
            widget.isCorrect = true;
          });
          var dbRef = widget.tequizParticipationDBst
              .child(widget.dateFormat)
              .child(widget.popupQuestionId.toString())
              .child(widget.customerPhoneNumber);
          dbRef.set({
            'answer': 'CORRECT',
            'date': DateTime.now().toUtc().millisecondsSinceEpoch,
            'mobile': widget.customerPhoneNumber,
            'name': widget.customerName ?? '',
            'quizId': widget.popupQuestionId
          });
        } else {
          setState(() {
            widget.isWrong = true;
          });
          var dbRef = widget.tequizParticipationDBst
              .child(widget.dateFormat)
              .child(widget.popupQuestionId.toString())
              .child(widget.customerPhoneNumber);
          dbRef.set({
            'answer': 'WRONG',
            'date': DateTime.now().toUtc().millisecondsSinceEpoch,
            'mobile': widget.customerPhoneNumber,
            'name': widget.customerName ?? '',
            'quizId': widget.popupQuestionId
          });
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 5),
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: widget.isCorrect == true
                ? Colors.green
                : widget.isWrong == true
                    ? Colors.red
                    : Colors.white,
            border: Border.all(color: AppColors.primaryColor, width: 2)),
        child: Text(
          widget.text,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
