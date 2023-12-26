import 'package:flutter/material.dart';
import 'package:flutter_babuland_app/bloc/ticket_items/ticket_items_bloc.dart';
import 'package:flutter_babuland_app/custom_classes/hive_box_utils.dart';
import 'package:flutter_babuland_app/custom_classes/ticket_invoice_page_arguments.dart';
import 'package:flutter_babuland_app/custom_widgets/app_button.dart';
import 'package:flutter_babuland_app/custom_widgets/custom_app_bar.dart';
import 'package:flutter_babuland_app/custom_widgets/ticket_item_container.dart';
import 'package:flutter_babuland_app/data/repository/ticket_item_repository.dart';
import 'package:flutter_babuland_app/theme_helpers/colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hive_flutter/hive_flutter.dart';

class SelectTicketsPage extends StatelessWidget {
  static Set<TicketItemContainer> ticketItemList = {};

  static Set<TicketItemContainer> filteredTicketItemList = {};

  @override
  Widget build(BuildContext context) {
    ticketItemList.clear();
    filteredTicketItemList.clear();

    return BlocProvider(
      create: (context) =>
          TicketItemsBloc(RepositoryProvider.of<TicketItemRepository>(context))
            ..add(LoadTicketItemsApiEvent()),
      child: Scaffold(
        appBar: CustomAppBar(
          backgroundColor: Colors.white,
          title: 'Select Tickets',
        ),
        body: Container(
          color: Colors.white,
          child: Column(
            children: [
              BlocBuilder<TicketItemsBloc, TicketItemsState>(
                builder: (context, state) {
                  if (state is TicketItemsLoadedState) {
                    return SizedBox(
                      height: MediaQuery.of(context).size.height * .75,
                      child: ListView.builder(
                          itemCount: state.ticketItemModel.items.length,
                          itemBuilder: (context, index) {
                            ticketItemList.add(TicketItemContainer(
                              ticketItemId:
                                  state.ticketItemModel.items[index].itemId,
                              description:
                                  state.ticketItemModel.items[index].itemDsc ??
                                      '',
                              price: state.ticketItemModel.items[index].mrp,
                              ticketName: state
                                  .ticketItemModel.items[index].productName,
                              ticketQty: 0,
                            ));
                            return TicketItemContainer(
                              ticketItemId:
                                  state.ticketItemModel.items[index].itemId,
                              description:
                                  state.ticketItemModel.items[index].itemDsc ??
                                      '',
                              price: state.ticketItemModel.items[index].mrp,
                              ticketName: state
                                  .ticketItemModel.items[index].productName,
                              ticketQty: 0,
                            );
                          }),
                    );
                  } else {
                    return Center(
                      child: SpinKitFadingFour(
                        color: AppColors.primaryColor,
                      ),
                    );
                  }
                },
              ),
              InkWell(
                onTap: () {
                  for (int i = 0; i < ticketItemList.length; i++) {
                    if (ticketItemList.elementAt(i).ticketQty != 0) {
                      filteredTicketItemList.add(ticketItemList.elementAt(i));
                    } else {
                      filteredTicketItemList
                          .remove(ticketItemList.elementAt(i));
                    }
                  }

                  if (filteredTicketItemList.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: const Text(
                        'Please Select Tickets',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      backgroundColor: AppColors.primaryRed,
                    ));
                  } else {
                    Navigator.pushNamed(context, 'ticketInvoicePage',
                        arguments: TicketInvoicePageArguments(
                            list: filteredTicketItemList));
                  }
                },
                child: AppButton(height: 50, width: 275, text: ' Next >'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
