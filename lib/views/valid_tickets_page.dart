import 'package:flutter/material.dart';
import 'package:flutter_babuland_app/bloc/valid_ticket_order/valid_ticket_order_bloc.dart';
import 'package:flutter_babuland_app/custom_classes/hive_box_utils.dart';
import 'package:flutter_babuland_app/custom_classes/local_notification.dart';

import 'package:flutter_babuland_app/custom_widgets/custom_app_bar.dart';
import 'package:flutter_babuland_app/custom_widgets/ticket_item_container.dart';
import 'package:flutter_babuland_app/custom_widgets/ticket_order_container.dart';
import 'package:flutter_babuland_app/data/model/running_ticket_counter.dart';
import 'package:flutter_babuland_app/data/repository/valid_ticket_order_repository.dart';
import 'package:flutter_babuland_app/theme_helpers/colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:notification_permissions/notification_permissions.dart';

class ValidTicketsPage extends StatelessWidget {
  ValidTicketsPage({Key? key}) : super(key: key);

  static Set<TicketItemContainer> selectedMyTicketItemList = {};

  DateTime? expDate;

  int runningTicketCount = 0;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ValidTicketOrderBloc(
          RepositoryProvider.of<ValidTicketOrderRepository>(context))
        ..add(LoadValidTicketOrderApiEvent()),
      child: Scaffold(
        appBar: CustomAppBar(
          title: 'Ticket Orders',
          backgroundColor: Colors.white,
        ),
        backgroundColor: Colors.white,
        body: BlocBuilder<ValidTicketOrderBloc, ValidTicketOrderState>(
          builder: (context, state) {
            if (state is ValidTicketOrderLoadedState) {
              for (int i = 0; i < state.ticketOrderModel.items.length; i++) {
                if (state.ticketOrderModel.items[i].unixtimestamp != null) {
                  expDate = DateTime.fromMillisecondsSinceEpoch(int.parse(
                      state.ticketOrderModel.items[i].unixtimestamp!));
                  if (expDate!.isAfter(DateTime.now()) &&
                      state.ticketOrderModel.items[i].appAvil == 1) {
                    runningTicketCount++;
                  }
                }
              }
              if (runningTicketCount > 0) {
                final box = HiveBoxUtils.getRunningTicketCounter();

                if (box.values.isEmpty ||
                    box.values.first.count == 0 ||
                    box.values.first.count != runningTicketCount) {
                  LocalNotificationAPI.showNotification(
                          title: 'Babuland',
                          body:
                              'You have $runningTicketCount ticket(s) running')
                      .then((value) {
                    final counter = RunningTicketCounter()
                      ..count = runningTicketCount;
                    box.put('running_ticket_counter', counter);
                    Future.delayed(const Duration(minutes: 121), () {
                      box.delete('running_ticket_counter');
                    });
                  });
                }
              }
              if (state.ticketOrderModel.items.isEmpty) {
                return Center(
                    child: Text(
                  'No valid tickets',
                  style: TextStyle(color: AppColors.textGrey2),
                ));
              } else {
                return ListView.builder(
                    itemCount: state.ticketOrderModel.items.length,
                    itemBuilder: (context, index) {
                      return TicketOrderContainer(
                        orderId: state.ticketOrderModel.items[index].pk,
                        purchaseDate:
                            state.ticketOrderModel.items[index].sellDate,
                        ticketOrderStartDate:
                            state.ticketOrderModel.items[index].startDate,
                        orderUnixTimeStamp:
                            state.ticketOrderModel.items[index].unixtimestamp,
                        isAvailed: state.ticketOrderModel.items[index].appAvil,
                        priceRecieved:
                            state.ticketOrderModel.items[index].receivedAmount,
                        priceDiscount:
                            state.ticketOrderModel.items[index].discountAmount,
                        discountCoupon:
                            state.ticketOrderModel.items[index].discountCoupon,
                      );
                    });
              }
            } else {
              return Center(
                child: SpinKitFadingGrid(
                  color: AppColors.primaryColor,
                  size: 25,
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
