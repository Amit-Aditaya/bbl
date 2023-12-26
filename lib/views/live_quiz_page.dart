import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_babuland_app/bloc/customer/customer_bloc.dart';
import 'package:flutter_babuland_app/custom_widgets/live_quiz_bottom_sheet_stream.dart';
import 'package:flutter_babuland_app/custom_widgets/live_quiz_chat_container.dart';
import 'package:flutter_babuland_app/custom_widgets/live_quiz_viewer_count.dart';
import 'package:flutter_babuland_app/data/repository/customer_repository.dart';
import 'package:flutter_babuland_app/theme_helpers/colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';
//import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class LiveQuizPage extends StatelessWidget {
  final String customerPhoneNumber;
  final String customerName;
  LiveQuizPage({
    Key? key,
    required this.customerPhoneNumber,
    required this.customerName,
  }) : super(key: key);

  TextEditingController commentEditingController = TextEditingController();

  String dateFormat = DateFormat('yyyy_MMM_dd').format(DateTime.now());

  DatabaseReference liveQuizScreenDB =
      FirebaseDatabase.instance.ref().child('LiveQuizScreen');
  DatabaseReference quizPopupDB =
      FirebaseDatabase.instance.ref().child('quiz_pop_up');
  DatabaseReference quizParticipationDB =
      FirebaseDatabase.instance.ref().child('quiz_participation');
  DatabaseReference test =
      FirebaseDatabase.instance.ref().child('user_test_node').child('test');
  DatabaseReference liveQuizzes =
      FirebaseDatabase.instance.ref().child('live_quizzes');
  DatabaseReference liveQuizViewerDB =
      FirebaseDatabase.instance.ref().child('live_quiz_viewer');
  DatabaseReference liveQuizVideoLink =
      FirebaseDatabase.instance.ref().child('lq_video');

  // YoutubePlayerController _controller = YoutubePlayerController(
  //   initialVideoId: 'YQRScCUH6Hc',
  //   flags: const YoutubePlayerFlags(
  //     autoPlay: true,
  //     hideControls: true,
  //   ),
  // );

  @override
  Widget build(BuildContext context) {
    DatabaseReference commentsDB =
        FirebaseDatabase.instance.ref().child('comments').child(dateFormat);
    Future.delayed(const Duration(milliseconds: 2500), () {
      var viewerRef =
          liveQuizViewerDB.child(dateFormat).child(customerPhoneNumber);

      viewerRef.set({
        'active': true,
        'mobile': customerPhoneNumber,
      });
    });

    // liveQuizVideoLink.onValue.listen((event) {
    //   _controller = YoutubePlayerController(
    //     initialVideoId: (event.snapshot.value as dynamic)['id'],
    //     flags: const YoutubePlayerFlags(
    //       autoPlay: true,
    //       hideControls: true,
    //     ),
    //   );
    // });

    return BlocProvider(
      create: (context) =>
          CustomerBloc(RepositoryProvider.of<CustomerRepository>(context))
            ..add(LoadCustomerApiEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Live Quiz',
            style: TextStyle(color: AppColors.primaryColor),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
              var viewerRef =
                  liveQuizViewerDB.child(dateFormat).child(customerPhoneNumber);
              viewerRef.set({
                'active': false,
                'mobile': customerPhoneNumber,
              });
            },
            child: Icon(
              Icons.arrow_back,
              color: AppColors.primaryColor,
            ),
          ),
        ),
        body: StreamBuilder<Object>(
            stream: liveQuizScreenDB.onValue,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Container(
                  color: Colors.white,
                  child: Stack(children: [
                    SafeArea(
                        child: (snapshot.data as dynamic)
                                    .snapshot
                                    .children
                                    .elementAt(0)
                                    .value ==
                                'Y'

                            //   isLive == false  //live quiz off

                            ? Container(
                                height: double.infinity,
                                width: double.infinity,
                                color: Colors.white,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const SizedBox(height: 150),
                                    Image(
                                      image: NetworkImage(
                                          '${(snapshot.data as dynamic).snapshot.children.elementAt(2).value}',
                                          scale: 3),
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                      '${(snapshot.data as dynamic).snapshot.children.elementAt(3).value}',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: AppColors.textGrey2,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                              )
                            :
                            // : YoutubePlayerBuilder(
                            //     player: YoutubePlayer(controller: _controller),
                            //     builder: (context, player) {
                            //       return SizedBox(
                            //         height: double.infinity,
                            //         width: double.infinity,
                            //         child: player,
                            //       );
                            //     },
                            //   ),
                            const SizedBox(
                                height: 1,
                              )),
                    SizedBox(
                      child: Column(children: [
                        Expanded(
                            child: SizedBox(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              //isLive == false
                              (snapshot.data as dynamic)
                                          .snapshot
                                          .children
                                          .elementAt(0)
                                          .value ==
                                      'Y'
                                  ? SizedBox(height: 1)
                                  : Container(
                                      margin: const EdgeInsets.all(2),
                                      decoration: BoxDecoration(
                                          color: AppColors.primaryColor,
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 5, horizontal: 20),
                                      child: FutureBuilder(
                                          future: liveQuizScreenDB.get(),
                                          builder: (context, snapshot) {
                                            if (snapshot.hasData) {
                                              return Text(
                                                (snapshot.data as dynamic)
                                                    .value['episode_msg'],
                                                style: const TextStyle(
                                                    color: Colors.white),
                                              );
                                            } else {
                                              return CircularProgressIndicator();
                                            }
                                          }),
                                    ),
                              // isLive == false
                              (snapshot.data as dynamic)
                                          .snapshot
                                          .children
                                          .elementAt(0)
                                          .value ==
                                      'Y'
                                  ? SizedBox(height: 1)
                                  : Column(
                                      children: [
                                        Container(
                                          margin: const EdgeInsets.all(2),
                                          decoration: BoxDecoration(
                                              color: Colors.red,
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 5, horizontal: 20),
                                          child: const Text(
                                            '◉ Live',
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ),
                                        LiveQuizViewerCount(),
                                      ],
                                    ),
                            ],
                          ),
                        )),
                        const LiveQuizChatContainer(),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 7.5),
                          height: 55,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Expanded(
                                child: Container(
                                  height: 50,
                                  //width: 200,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0,
                                    vertical: 0.0,
                                  ),
                                  margin: const EdgeInsets.all(8.0),
                                  decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    border: Border.all(
                                      color: Theme.of(context).primaryColor,
                                      width: 2.5,
                                    ),
                                    borderRadius: BorderRadius.circular(5),
                                  ),

                                  child: SingleChildScrollView(
                                    child: TextField(
                                        style: TextStyle(
                                            fontSize: 13,
                                            color:
                                                //isLive == false
                                                (snapshot.data as dynamic)
                                                            .snapshot
                                                            .children
                                                            .elementAt(0)
                                                            .value ==
                                                        'Y'
                                                    ? Colors.black
                                                    : Colors.white),
                                        maxLines: 6,
                                        controller: commentEditingController,
                                        decoration: const InputDecoration(
                                          border: InputBorder.none,
                                          isDense: true,
                                        )),
                                  ),
                                ),
                              ),
                              BlocBuilder<CustomerBloc, CustomerState>(
                                builder: (context, state) {
                                  if (state is CustomerLoadedState) {
                                    return TextButton(
                                      onPressed: () async {
                                        DatabaseReference dbRef =
                                            commentsDB.push();
                                        await dbRef.set({
                                          'id': dbRef.key,
                                          'msg': commentEditingController.text,
                                          'phone': state.customerModel.items[0]
                                              .mobileNumber,
                                          'user': state.customerModel.items[0]
                                                  .fullname ??
                                              state.customerModel.items[0]
                                                  .mobileNumber,
                                          'userId':
                                              state.customerModel.items[0].id,
                                          'platform': 'IOS',
                                        });
                                        commentEditingController.clear();
                                      },
                                      style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  AppColors.primaryColor)),
                                      child: const Text(
                                        'Comment',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    );
                                  } else {
                                    return SpinKitSquareCircle(
                                      color: AppColors.primaryColor,
                                    );
                                  }
                                },
                              ),
                            ],
                          ),
                        ),
                      ]),
                    )
                  ]),
                );
              } else {
                return Center(
                  child: SpinKitFadingGrid(
                    color: AppColors.primaryColor,
                  ),
                );
              }
            }),
        bottomSheet: LiveQuizBottomSheetStream(
          customerName: customerName,
          customerPhoneNumber: customerPhoneNumber,
        ),
      ),
    );
  }
}
