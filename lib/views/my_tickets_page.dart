import 'package:flutter/material.dart';
import 'package:flutter_babuland_app/bloc/ticket_order/ticket_order_bloc.dart';
import 'package:flutter_babuland_app/custom_classes/hive_box_utils.dart';
import 'package:flutter_babuland_app/custom_widgets/custom_app_bar.dart';
import 'package:flutter_babuland_app/custom_widgets/ticket_item_container.dart';
import 'package:flutter_babuland_app/custom_widgets/ticket_order_container.dart';
import 'package:flutter_babuland_app/data/repository/ticket_order_repository.dart';
import 'package:flutter_babuland_app/theme_helpers/colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hive_flutter/adapters.dart';

class MyTicketsPage extends StatelessWidget {
  const MyTicketsPage({Key? key}) : super(key: key);

  static Set<TicketItemContainer> selectedMyTicketItemList = {};

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          TicketOrderBloc(RepositoryProvider.of<TicketOrderRepository>(context))
            ..add(LoadTicketOrderApiEvent()),
      child: Scaffold(
        appBar: CustomAppBar(
          title: 'Ticket Orders',
          backgroundColor: Colors.white,
        ),
        backgroundColor: Colors.white,
        body: BlocBuilder<TicketOrderBloc, TicketOrderState>(
          builder: (context, state) {
            if (state is TicketOrderLoadedState) {
              return ListView.builder(
                  itemCount: state.ticketOrderModel.items.length,
                  itemBuilder: (context, index) {
                    return TicketOrderContainer(
                      discountCoupon:
                          state.ticketOrderModel.items[index].discountCoupon,
                      orderId: state.ticketOrderModel.items[index].pk,
                      purchaseDate:
                          state.ticketOrderModel.items[index].sellDate,
                      ticketOrderStartDate:
                          state.ticketOrderModel.items[index].startDate,
                      orderUnixTimeStamp:
                          state.ticketOrderModel.items[index].unixtimestamp,
                      isAvailed: state.ticketOrderModel.items[index].appAvil,
                      priceRecieved: state.ticketOrderModel.items[index].total,
                      priceDiscount:
                          state.ticketOrderModel.items[index].discountAmount,
                    );
                  });
            } else {
              return Center(
                child: SpinKitFadingGrid(
                  color: AppColors.primaryColor,
                  size: 30,
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
