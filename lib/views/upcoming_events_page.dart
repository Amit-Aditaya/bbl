import 'package:flutter/material.dart';
import 'package:flutter_babuland_app/bloc/upcoming_event/upcoming_event_bloc.dart';
import 'package:flutter_babuland_app/custom_widgets/event_card.dart';
import 'package:flutter_babuland_app/data/model/upcoming_event_model.dart';
import 'package:flutter_babuland_app/theme_helpers/colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpcomingEvents extends StatelessWidget {
  // const UpcomingEvents({Key? key}) : super(key: key);

  final UpcomingEventModel upcomingEventModel;
  const UpcomingEvents({
    Key? key,
    required this.upcomingEventModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(5),
          padding: const EdgeInsets.all(5),
          width: double.infinity,
          color: Colors.transparent,
          child: BlocBuilder<UpcomingEventBloc, UpcomingEventState>(
            builder: (context, state) {
              if (upcomingEventModel.items.isEmpty) {
                return Center(
                    child: Text(
                  'No Upcoming Events',
                  style: TextStyle(color: AppColors.textGrey2),
                ));
              } else {
                return ListView.builder(
                    itemCount: upcomingEventModel.items.length,
                    itemBuilder: (context, index) {
                      return UpComingEventCard(
                          eventId: upcomingEventModel.items[index].appeventId,
                          eventName:
                              upcomingEventModel.items[index].appeventName,
                          imageName:
                              upcomingEventModel.items[index].imageFileName,
                          eventDate:
                              upcomingEventModel.items[index].appeventDate,
                          eventDetails:
                              upcomingEventModel.items[index].appeventDetails);
                    });
              }
            },
          ),
        ),
      ),
    ));
  }
}
