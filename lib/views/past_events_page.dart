import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_babuland_app/bloc/past_event/past_event_bloc.dart';
import 'package:flutter_babuland_app/custom_widgets/past_event_card.dart';
import 'package:flutter_babuland_app/data/model/past_event_model.dart';
import 'package:flutter_babuland_app/theme_helpers/colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PastEvents extends StatefulWidget {
  final PastEventModel pastEventModel;
  const PastEvents({
    Key? key,
    required this.pastEventModel,
  }) : super(key: key);

  @override
  State<PastEvents> createState() => _PastEventsState();
}

class _PastEventsState extends State<PastEvents> {
  // late List lazyLoadList;
  // final ScrollController _scrollController = ScrollController();
//  int currentMax = 6;

  // @override
  // void initState() {
  //   lazyLoadList = widget.pastEventModel.items.toList().sublist(0, currentMax);
  //   _scrollController.addListener(() {
  //     if (_scrollController.position.pixels ==
  //         _scrollController.position.maxScrollExtent) {
  //       _getMoreList();
  //     }
  //   });
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Container(
            margin: const EdgeInsets.all(5),
            padding: const EdgeInsets.all(5),
            width: double.infinity,
            color: Colors.transparent,
            child: BlocBuilder<PastEventBloc, PastEventState>(
              builder: (context, state) {
                if (state is PastEventLoadedState) {
                  return ListView.builder(
                      //  controller: _scrollController,
                      //itemCount: lazyLoadList.length + 1,
                      itemCount: state.pastEventModel.items.length,
                      itemBuilder: (context, index) {
                        // if (index == lazyLoadList.length) {
                        //   return CupertinoActivityIndicator(
                        //     color: AppColors.primaryColor,
                        //   );
                        // }
                        return PastEventCard(
                            eventId:
                                widget.pastEventModel.items[index].appeventId,
                            eventName:
                                widget.pastEventModel.items[index].appeventName,
                            imageName: widget
                                .pastEventModel.items[index].imageFileName,
                            eventDate:
                                widget.pastEventModel.items[index].appeventDate,
                            eventDetails: widget
                                .pastEventModel.items[index].appeventDetails);
                      });
                } else {
                  return CircularProgressIndicator();
                }
              },
            ),
          ),
        ),
      ),
    );
  }

  // void _getMoreList() {
  //   for (int i = currentMax; i < currentMax + 6; i++) {
  //     lazyLoadList.add(widget.pastEventModel.items[i]);
  //   }
  //   currentMax = currentMax + 6;
  //   setState(() {});
  // }
}
