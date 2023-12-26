import 'package:flutter/material.dart';
import 'package:flutter_babuland_app/custom_widgets/ticket.dart';
import 'package:flutter_babuland_app/data/model/free_ticket_model.dart';

class TicketContainer extends StatelessWidget {
  //const TicketContainer({Key? key}) : super(key: key);
  final Item freeTicketItem;
  const TicketContainer({
    Key? key,
    required this.freeTicketItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 186,
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
      color: Colors.transparent,
      child: Ticket(
        freeTicketItem: freeTicketItem,
      ),
    );
  }
}
