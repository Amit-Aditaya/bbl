import 'package:flutter_babuland_app/custom_widgets/ticket_container.dart';
import 'package:flutter_babuland_app/custom_widgets/ticket_item_container.dart';

class TicketDetailsPageArguments {
  Set<TicketItemContainer> list;
  String? expDate;
  TicketContainer ticketContainer;

  TicketDetailsPageArguments({
    required this.list,
    required this.ticketContainer,
  });
}
