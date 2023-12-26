import 'package:flutter/material.dart';
import 'package:flutter_babuland_app/bloc/expired_ticket_order/expired_ticket_order_bloc.dart';
import 'package:flutter_babuland_app/custom_widgets/custom_app_bar.dart';
import 'package:flutter_babuland_app/custom_widgets/ticket_item_container.dart';
import 'package:flutter_babuland_app/custom_widgets/ticket_order_container.dart';
import 'package:flutter_babuland_app/data/repository/expired_ticket_repository.dart';
import 'package:flutter_babuland_app/theme_helpers/colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ExpiredTicketsPage extends StatelessWidget {
  const ExpiredTicketsPage({Key? key}) : super(key: key);

  static Set<TicketItemContainer> selectedMyTicketItemList = {};

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ExpiredTicketOrderBloc(
          RepositoryProvider.of<ExpiredTicketRepository>(context))
        ..add(LoadExpiredTicketOrderApiEvent()),
      child: Scaffold(
        appBar: CustomAppBar(
          title: 'Ticket Orders',
          backgroundColor: Colors.white,
        ),
        backgroundColor: Colors.white,
        body: BlocBuilder<ExpiredTicketOrderBloc, ExpiredTicketOrderState>(
          builder: (context, state) {
            if (state is ExpiredTicketOrderLoadedState) {
              if (state.ticketOrderModel.items.isEmpty) {
                return Center(
                  child: Text(
                    'No Expired or Used Tickets',
                    style: TextStyle(color: AppColors.textGrey2),
                  ),
                );
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
                            state.ticketOrderModel.items[index].total,
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
