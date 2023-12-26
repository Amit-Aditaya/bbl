import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_babuland_app/cubit/ticket_count/ticket_count_cubit.dart';
import 'package:flutter_babuland_app/theme_helpers/colors.dart';
import 'package:flutter_babuland_app/theme_helpers/shadows.dart';
import 'package:flutter_babuland_app/views/select_tickets_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TicketItemContainer extends StatelessWidget {
  final int ticketItemId;
  final String ticketName;
  final int price;
  final String description;
  int ticketQty;

  TicketItemContainer({
    Key? key,
    required this.ticketItemId,
    required this.ticketName,
    required this.price,
    required this.description,
    required this.ticketQty,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      width: 250,
      margin: const EdgeInsets.symmetric(horizontal: 35, vertical: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        boxShadow: [AppShadows.buttonShadow],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Flexible(
            child: Container(
              height: 150,
              width: 125,
              color: Colors.transparent,
              padding: const EdgeInsets.all(2.5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  Text(
                    ticketName,
                    style:
                        TextStyle(color: AppColors.primaryColor, fontSize: 22),
                  ),
                  Text(
                    '${price}tk',
                    style: const TextStyle(color: Colors.black, fontSize: 18),
                  ),
                  Text(
                    description,
                    style: TextStyle(color: AppColors.textGrey2, fontSize: 12),
                  ),
                ],
              ),
            ),
          ),
          Flexible(
            child: BlocProvider(
              create: (context) => TicketCountCubit(),
              child: Container(
                height: 110,
                //width: 125,
                color: Colors.transparent,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Builder(builder: (context) {
                      return InkWell(
                        onTap: () {
                          if (ticketQty == 0) {
                            ticketQty = 0;
                          } else {
                            BlocProvider.of<TicketCountCubit>(context)
                                .decrement();
                            ticketQty--;
                          }

                          for (int i = 0;
                              i < SelectTicketsPage.ticketItemList.length;
                              i++) {
                            if (ticketName ==
                                SelectTicketsPage.ticketItemList
                                    .elementAt(i)
                                    .ticketName) {
                              SelectTicketsPage.ticketItemList
                                  .elementAt(i)
                                  .ticketQty = ticketQty;
                            }
                          }
                        },
                        child: Container(
                          height: 40,
                          width: 40,
                          margin: const EdgeInsets.all(1),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.primaryColor,
                          ),
                          child: const Center(
                              child: Icon(
                            Icons.remove,
                            color: Colors.white,
                          )),
                        ),
                      );
                    }),
                    const SizedBox(width: 10),
                    BlocBuilder<TicketCountCubit, TicketCountState>(
                      builder: (context, state) {
                        if (state.value <= 0) {
                          state.value = 0;
                          return const Text(
                            '0',
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                                fontWeight: FontWeight.w500),
                          );
                        } else {
                          return Text(
                            '${state.value}',
                            style: const TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                                fontWeight: FontWeight.w500),
                          );
                        }
                      },
                    ),
                    const SizedBox(width: 10),
                    Builder(builder: (context) {
                      return InkWell(
                        onTap: () {
                          BlocProvider.of<TicketCountCubit>(context)
                              .increment();

                          ticketQty++;

                          for (int i = 0;
                              i < SelectTicketsPage.ticketItemList.length;
                              i++) {
                            if (ticketName ==
                                SelectTicketsPage.ticketItemList
                                    .elementAt(i)
                                    .ticketName) {
                              SelectTicketsPage.ticketItemList
                                  .elementAt(i)
                                  .ticketQty = ticketQty;
                            }
                          }

                          // if (SelectTicketsPage.ticketItemList.isEmpty) {
                          //   SelectTicketsPage.ticketItemList.add(
                          //       TicketItemContainer(
                          //           ticketName: ticketName,
                          //           price: price,
                          //           description: description,
                          //           ticketQty: ticketQty));
                          // } else {
                          //   for (int i = 0;
                          //       i < SelectTicketsPage.ticketItemList.length;
                          //       i++) {
                          //     if (ticketName ==
                          //         SelectTicketsPage.ticketItemList
                          //             .elementAt(i)
                          //             .ticketName) {
                          //       SelectTicketsPage.ticketItemList
                          //           .elementAt(i)
                          //           .ticketQty = ticketQty;
                          //     }
                          //   }
                          // }

                          // TicketItemContainer x = TicketItemContainer(
                          //   description: description,
                          //   ticketName: ticketName,
                          //   price: price,
                          // );

                          // x.ticketQty = ticketQty;

                          // SelectTicketsPage.ticketItemList.add(x);
                        },
                        child: Container(
                          height: 40,
                          width: 40,
                          margin: const EdgeInsets.all(1),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.primaryColor,
                          ),
                          child: const Center(
                              child: Icon(
                            Icons.add,
                            color: Colors.white,
                          )),
                        ),
                      );
                    }),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
