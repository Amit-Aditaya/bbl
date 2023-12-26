import 'package:flutter/material.dart';
import 'package:flutter_babuland_app/bloc/past_event/past_event_bloc.dart';
import 'package:flutter_babuland_app/bloc/upcoming_event/upcoming_event_bloc.dart';
import 'package:flutter_babuland_app/data/repository/past_events_repository.dart';
import 'package:flutter_babuland_app/data/repository/upcoming_event_repository.dart';
import 'package:flutter_babuland_app/theme_helpers/colors.dart';
import 'package:flutter_babuland_app/views/past_events_page.dart';
import 'package:flutter_babuland_app/views/upcoming_events_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EventsPage extends StatelessWidget {
  const EventsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              PastEventBloc(RepositoryProvider.of<PastEventRepository>(context))
                ..add(LoadApiEvent()),
        ),
        BlocProvider(
          create: (context) => UpcomingEventBloc(
              RepositoryProvider.of<UpcomingEventRepository>(context))
            ..add(LoadUpcomingEventApiEvent()),
        ),
      ],
      child: DefaultTabController(
        length: 2,
        initialIndex: 0,
        child: Scaffold(
          appBar: AppBar(
            iconTheme: IconThemeData(color: AppColors.primaryColor),
            title: Text(
              'Events',
              style: TextStyle(color: AppColors.primaryColor),
            ),
            centerTitle: true,
            backgroundColor: Colors.white,
            bottom: TabBar(
              indicatorColor: AppColors.primaryColor,
              indicatorWeight: 6,
              unselectedLabelColor: const Color(0xffCFD1CE),
              labelColor: AppColors.primaryColor,
              tabs: const [
                Tab(
                  icon: Icon(Icons.event),
                  text: "Upcoming",
                ),
                Tab(
                  icon: Icon(Icons.alarm_sharp),
                  text: "Past Events",
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              BlocBuilder<UpcomingEventBloc, UpcomingEventState>(
                builder: (context, state) {
                  if (state is UpcomingEventLoadedState) {
                    return UpcomingEvents(
                      upcomingEventModel: state.upcomingEventModel,
                    );
                  } else {
                    return Center(
                      child: CircularProgressIndicator(
                        color: AppColors.primaryColor,
                      ),
                    );
                  }
                },
              ),
              BlocBuilder<PastEventBloc, PastEventState>(
                builder: (context, state) {
                  if (state is PastEventLoadedState) {
                    return PastEvents(pastEventModel: state.pastEventModel);
                  } else {
                    return Center(
                      child: CircularProgressIndicator(
                        color: AppColors.primaryColor,
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
