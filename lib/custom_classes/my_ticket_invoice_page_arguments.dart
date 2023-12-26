class MyTicketInvoicePageArguments {
  final int ticketOrderId;
  final int ticketPrice;
  final String ticketPurchaseDate;
  final String? ticketUnixTimeStamp;
  final int discountAmount;
  final String? discountCoupon;

  MyTicketInvoicePageArguments({
    required this.ticketOrderId,
    required this.ticketPrice,
    required this.discountAmount,
    required this.ticketPurchaseDate,
    required this.ticketUnixTimeStamp,
    required this.discountCoupon,
  });
}
