import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_babuland_app/theme_helpers/colors.dart';
import 'package:intl/intl.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class LiveQuizChatContainer extends StatefulWidget {
  const LiveQuizChatContainer({Key? key}) : super(key: key);

  @override
  State<LiveQuizChatContainer> createState() => _LiveQuizChatContainerState();
}

class _LiveQuizChatContainerState extends State<LiveQuizChatContainer> {
  DateTime dateTime = DateTime.now();

  late DatabaseReference db;

  static ItemScrollController itemScrollController = ItemScrollController();

  @override
  void initState() {
    String dateFormat = DateFormat('yyyy_MMM_dd').format(dateTime);
    db = FirebaseDatabase.instance.ref().child('comments').child(dateFormat);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .17,
      color: Colors.black.withOpacity(.25),
      width: double.infinity,
      child: StreamBuilder(
          stream: db.onValue,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              Future.delayed(const Duration(milliseconds: 200), () {
                if ((snapshot.data as dynamic).snapshot.children.length > 2) {
                  itemScrollController.scrollTo(
                      index:
                          (snapshot.data as dynamic).snapshot.children.length,
                      duration: const Duration(milliseconds: 100));
                }
              });

              return ScrollablePositionedList.builder(
                  initialScrollIndex:
                      (snapshot.data as dynamic).snapshot.children.length,
                  itemCount:
                      (snapshot.data as dynamic).snapshot.children.length,
                  itemScrollController: itemScrollController,
                  itemBuilder: (context, index) {
                    return ListTile(
                        title: Text(
                          '${(snapshot.data as dynamic).snapshot.children.elementAt(index).value['user']}',
                          style: TextStyle(color: AppColors.primaryColor),
                        ),
                        subtitle: Text(
                          '${(snapshot.data as dynamic).snapshot.children.elementAt(index).value['msg']}',
                          style: const TextStyle(color: Colors.white),
                        ));
                  });
            } else {
              return const SizedBox(
                height: 1,
              );
            }
          }),
    );
  }
}
