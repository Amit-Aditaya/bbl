import 'package:flutter/material.dart';
import 'package:flutter_babuland_app/custom_widgets/my_ticket.dart';

class MyTicketContainer extends StatelessWidget {
  final int orderItemId;
  final String ticketItemType;
  final int price;
  final int ticketItemqty;
  final String? isAvailed;
  const MyTicketContainer({
    Key? key,
    required this.orderItemId,
    required this.ticketItemType,
    required this.price,
    required this.ticketItemqty,
    required this.isAvailed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 186,
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
      color: Colors.transparent,
      child: MyTicket(
        title: ticketItemType,
        orderItemId: orderItemId,
        price: price,
        qty: ticketItemqty,
        isAvailed: isAvailed,
      ),
    );
  }
}
