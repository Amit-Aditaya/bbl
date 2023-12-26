import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_babuland_app/bloc/notification_history/notification_history_bloc.dart';
import 'package:flutter_babuland_app/custom_widgets/custom_app_bar.dart';
import 'package:flutter_babuland_app/data/repository/notification_history_repository.dart';
import 'package:flutter_babuland_app/main.dart';
import 'package:flutter_babuland_app/theme_helpers/colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class NotificationHistoryPage extends StatelessWidget {
  const NotificationHistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotificationHistoryBloc(
          RepositoryProvider.of<NotificationHistoryRepository>(context))
        ..add(LoadNotificationHistoryApiEvent()),
      child: Scaffold(
        appBar: CustomAppBar(
          title: 'Notifications',
          backgroundColor: Colors.white,
        ),
        backgroundColor: Colors.grey.shade300,
        body: BlocBuilder<NotificationHistoryBloc, NotificationHistoryState>(
          builder: (context, state) {
            if (state is NotificationHistoryLoadedState) {
              return ListView.builder(
                  itemCount: state.notificationHistoryModel.limit,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 7.5, vertical: 7.5),
                      child: ListTile(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          //  side: BorderSide(color: Colors.black),
                        ),
                        tileColor: Colors.white,
                        title: Text(state.notificationHistoryModel
                            .notifications[index].headings.en),
                        subtitle: Text(state.notificationHistoryModel
                            .notifications[index].contents.en),
                      ),
                    );
                  });
            } else {
              return Center(
                  child: SpinKitHourGlass(
                color: AppColors.primaryColor,
              ));
            }
          },
        ),
      ),
    );
  }
}
