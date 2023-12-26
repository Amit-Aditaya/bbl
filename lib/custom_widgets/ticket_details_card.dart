import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_babuland_app/bloc/offer_items/offer_items_bloc.dart';
import 'package:flutter_babuland_app/custom_widgets/ticket_details_card_row.dart';
import 'package:flutter_babuland_app/custom_widgets/ticket_details_card_total_row.dart';
import 'package:flutter_babuland_app/data/repository/offer_item_repository.dart';
import 'package:flutter_babuland_app/theme_helpers/colors.dart';
import 'package:flutter_babuland_app/views/offer_ticket_invoice_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

class TicketDetailsCard extends StatelessWidget {
  // const TicketDetailsCard({Key? key}) : super(key: key);
  final int comboPk;
  final double grandTotal;
  final double discount;
  const TicketDetailsCard({
    Key? key,
    required this.comboPk,
    required this.grandTotal,
    required this.discount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OfferItemsBloc(
          RepositoryProvider.of<OfferItemRepository>(context), comboPk)
        ..add(LoadOfferItemApiEvent()),
      child: ClipPath(
        clipBehavior: Clip.hardEdge,
        clipper: MultipleRoundedCurveClipper(),
        child: Container(
          width: double.infinity,
          margin: const EdgeInsets.symmetric(horizontal: 25),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Text(
                'Ticket Details',
                style: TextStyle(
                    fontSize: 16,
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 10,
              ),
              FittedBox(
                child: Container(
                  // height: 120,
                  color: Colors.transparent,
                  padding: const EdgeInsets.symmetric(horizontal: 1),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const SizedBox(
                            height: 25,
                            width: 40,
                          ),
                          const SizedBox(
                            height: 25,
                            width: 40,
                          ),
                          SizedBox(
                            height: 25,
                            width: 40,
                            child: Center(
                              child: Text(
                                'Price',
                                style: TextStyle(color: AppColors.textGrey2),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 25,
                            width: 40,
                            //color: Colors.green,
                          ),
                          SizedBox(
                            height: 25,
                            width: 40,
                            //color: Colors.green,
                            child: Center(
                              child: Text(
                                'Qty',
                                style: TextStyle(color: AppColors.textGrey2),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 25,
                            width: 40,
                            //color: Colors.green,
                          ),
                          SizedBox(
                            height: 25,
                            width: 40,
                            //color: Colors.green,
                            child: Center(
                              child: Text(
                                'Total',
                                style: TextStyle(color: AppColors.textGrey2),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 5),
                      // TicketDetailsCardRow(
                      //     ticketType: 'Guardian ',
                      //     price: 200,
                      //     qty: 2,
                      //     total: 400),
                      // TicketDetailsCardRow(
                      //   ticketType: 'Child',
                      //   price: 100,
                      //   qty: 1,
                      //   total: 100,
                      // ),
                      BlocBuilder<OfferItemsBloc, OfferItemsState>(
                        builder: (context, state) {
                          if (state is OfferItemLoadedState) {
                            for (int i = 0;
                                i < state.offerItemModel.items.length;
                                i++) {
                              OfferTicketInvoicePage.offerItemList
                                  .add(state.offerItemModel.items[i]);
                            }
                            return Column(
                              children: List.generate(
                                  state.offerItemModel.items.length,
                                  (index) => TicketDetailsCardRow(
                                      ticketItem: state.offerItemModel
                                          .items[index].productName,
                                      price: (state.offerItemModel.items[index]
                                                  .comboItemPrice /
                                              state.offerItemModel.items[index]
                                                  .qty)
                                          .toStringAsFixed(0),
                                      qty:
                                          state.offerItemModel.items[index].qty,
                                      total:
                                          '${state.offerItemModel.items[index].comboItemPrice}৳')),
                            );
                          } else {
                            return const CircularProgressIndicator();
                          }
                        },
                      ),

                      const SizedBox(height: 5),
                      const DottedLine(lineLength: 275),
                      const SizedBox(height: 10),
                      TicketDetailsCardTotalRow(
                        totalType: 'Sub Total',
                        total: '${(grandTotal + discount).toStringAsFixed(0)}৳',
                      ),
                      TicketDetailsCardTotalRow(
                        totalType: 'Discount',
                        total: '-${discount.toStringAsFixed(0)}৳',
                      ),
                      TicketDetailsCardTotalRow(
                        totalType: 'Grand Total',
                        total: '${grandTotal.toStringAsFixed(0)}৳',
                      ),
                      const SizedBox(height: 50),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
