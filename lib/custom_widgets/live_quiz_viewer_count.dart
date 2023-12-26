import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';

class LiveQuizViewerCount extends StatelessWidget {
  LiveQuizViewerCount({Key? key}) : super(key: key);
  DatabaseReference liveQuizViewerDB =
      FirebaseDatabase.instance.ref().child('live_quiz_viewer');

  String dateFormat = DateFormat('yyyy_MMM_dd').format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: liveQuizViewerDB.child(dateFormat).onValue,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return FutureBuilder(
                future: liveQuizViewerDB.child(dateFormat).get(),
                builder: (context, futureSnapshot) {
                  if (futureSnapshot.hasData) {
                    int viewCount = 200;
                    for (int i = 0;
                        i < (futureSnapshot.data as dynamic).children.length;
                        i++) {
                      if ((futureSnapshot.data as dynamic)
                              .children
                              .elementAt(i)
                              .value['active'] ==
                          true) {
                        viewCount++;
                      }
                    }

                    return Container(
                      padding: const EdgeInsets.all(2.5),
                      margin: const EdgeInsets.symmetric(vertical: 3),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.remove_red_eye_outlined,
                            color: Colors.white,
                          ),
                          const SizedBox(width: 5),
                          Text(
                            '$viewCount',
                            style: const TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    );
                  } else {
                    return const SizedBox(height: 1);
                  }
                });
          } else {
            return const SizedBox(height: 1);
          }
        });
  }
}
