import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_babuland_app/custom_classes/my_ticket_invoice_page_arguments.dart';
import 'package:flutter_babuland_app/theme_helpers/colors.dart';
import 'package:flutter_babuland_app/theme_helpers/shadows.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class TicketOrderContainer extends StatelessWidget {
  final int orderId;
  final String purchaseDate;
  final int priceRecieved;
  final int priceDiscount;
  final String? orderUnixTimeStamp;
  final String? ticketOrderStartDate;
  final int? isAvailed;
  final String? discountCoupon;

  const TicketOrderContainer(
      {Key? key,
      required this.orderId,
      required this.purchaseDate,
      required this.priceRecieved,
      required this.priceDiscount,
      required this.orderUnixTimeStamp,
      required this.isAvailed,
      required this.discountCoupon,
      required this.ticketOrderStartDate})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateTime? expDate;
    DateTime? startDate;
    String? expDateFormat;

    if (ticketOrderStartDate != null) {
      startDate = DateFormat('dd/MMM/yyyy').parse(ticketOrderStartDate!);
    }

    if (orderUnixTimeStamp != null) {
      expDate =
          DateTime.fromMillisecondsSinceEpoch(int.parse(orderUnixTimeStamp!));

      expDateFormat = DateFormat('dd-MMM-yyyy hh:mm a').format(expDate);
    }

    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20, top: 25),
      height: 200,
      decoration: BoxDecoration(
        color: expDate != null &&
                expDate.isAfter(DateTime.now()) &&
                isAvailed == 0 &&
                startDate != null &&
                startDate.isAfter(DateTime.now())
            ? const Color(0xffC5EFFC)
            : expDate == null ||
                    expDate.isAfter(DateTime.now()) &&
                        isAvailed == 0 &&
                        startDate != null &&
                        startDate.isBefore(DateTime.now())
                ? Colors.white
                : expDate.isBefore(DateTime.now()) && isAvailed == 0
                    ? const Color(0xffE9EDF5)
                    : expDate.isBefore(DateTime.now()) && isAvailed == 1
                        ? const Color(0xffFFD7D7)
                        : expDate.isAfter(DateTime.now()) && isAvailed == 1
                            ? const Color(0xffCCF7C0)
                            : Colors.white,
        boxShadow: [AppShadows.buttonShadow],
      ),
      child: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 7.5),
          decoration: BoxDecoration(
            border: Border(
                left: BorderSide(color: AppColors.primaryColor, width: 3),
                top: BorderSide(color: AppColors.primaryGreen, width: 3),
                right: BorderSide(color: AppColors.primaryBlue, width: 3),
                bottom: BorderSide(color: AppColors.primaryPink, width: 3)),
            color: expDate != null &&
                    expDate.isAfter(DateTime.now()) &&
                    isAvailed == 0 &&
                    startDate != null &&
                    startDate.isAfter(DateTime.now())
                ? const Color(0xffC5EFFC)
                : expDate == null ||
                        expDate.isAfter(DateTime.now()) &&
                            isAvailed == 0 &&
                            startDate != null &&
                            startDate.isBefore(DateTime.now())
                    ? Colors.white
                    : expDate.isBefore(DateTime.now()) && isAvailed == 0
                        ? const Color(0xffE9EDF5)
                        : expDate.isBefore(DateTime.now()) && isAvailed == 1
                            ? const Color(0xffFFD7D7)
                            : expDate.isAfter(DateTime.now()) && isAvailed == 1
                                ? const Color(0xffCCF7C0)
                                : Colors.white,
          ),
          height: 180,
          width: MediaQuery.of(context).size.width * .85,
          child: Column(
            children: [
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SvgPicture.asset(
                    'assets/images/qr_hand.svg',
                    height: 50,
                    width: 50,
                    fit: BoxFit.scaleDown,
                  ),
                  Column(
                    children: [
                      const Text(
                        'This is your Entry Ticket',
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      Text(
                        'Order ID : $orderId',
                        style: const TextStyle(fontSize: 13),
                      ),
                      Text(
                        'Order Price : $priceRecieved',
                        style: const TextStyle(
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                  SvgPicture.asset(
                    'assets/images/barcode.svg',
                    height: 50,
                    width: 50,
                    fit: BoxFit.scaleDown,
                  ),
                ],
              ),
              expDate != null &&
                      expDate.isAfter(DateTime.now()) &&
                      isAvailed == 0 &&
                      startDate != null &&
                      startDate.isAfter(DateTime.now())
                  ? Column(
                      children: [
                        Text(
                          '**can be availed after: ${DateFormat('dd-MMM-yyyy').format(startDate)}**',
                          style: const TextStyle(
                              color: Colors.lightBlue, fontSize: 12),
                        ),
                        const SizedBox(height: 5),
                      ],
                    )
                  : const SizedBox(height: 16.5),
              expDate != null &&
                      expDate.isAfter(DateTime.now()) &&
                      isAvailed == 0 &&
                      startDate != null &&
                      startDate.isAfter(DateTime.now())
                  ? Container(
                      height: 30,
                      width: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Color(0xff00C6F2),
                      ),
                      child: const Center(
                          child: Text(
                        'Pending',
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.w500),
                      )),
                    )
                  : expDate == null ||
                          expDate.isAfter(DateTime.now()) && isAvailed == 0 ||
                          isAvailed == null &&
                              startDate != null &&
                              startDate.isBefore(DateTime.now())
                      ? InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, 'myTicketInvoicePage',
                                arguments: MyTicketInvoicePageArguments(
                                    discountCoupon: discountCoupon,
                                    discountAmount: priceDiscount,
                                    ticketUnixTimeStamp: orderUnixTimeStamp,
                                    ticketOrderId: orderId,
                                    ticketPrice: priceRecieved,
                                    ticketPurchaseDate: purchaseDate));
                          },
                          child: Container(
                            height: 30,
                            width: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                  color: AppColors.primaryColor, width: 3),
                              color: Colors.white,
                            ),
                            child: Center(
                                child: Text(
                              'Active',
                              style: TextStyle(
                                  color: AppColors.primaryColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                            )),
                          ),
                        )
                      : expDate.isBefore(DateTime.now()) && isAvailed == 0
                          ? Container(
                              height: 30,
                              width: 150,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                // border: Border.all(
                                //     color: AppColors.primaryRed, width: 3),
                                color: const Color(0xffc4c4c4),
                              ),
                              child: const Center(
                                  child: Text(
                                'Expired',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500),
                              )),
                            )
                          : expDate.isBefore(DateTime.now()) && isAvailed == 1
                              ? Container(
                                  height: 30,
                                  width: 150,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: const Color(0xffff0000),
                                  ),
                                  child: const Center(
                                      child: Text(
                                    'Used',
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500),
                                  )),
                                )
                              : expDate.isAfter(DateTime.now()) &&
                                      isAvailed == 1
                                  ? InkWell(
                                      onTap: () {
                                        Navigator.pushNamed(
                                            context, 'myTicketInvoicePage',
                                            arguments:
                                                MyTicketInvoicePageArguments(
                                                    discountCoupon:
                                                        discountCoupon,
                                                    discountAmount:
                                                        priceDiscount,
                                                    ticketUnixTimeStamp:
                                                        orderUnixTimeStamp,
                                                    ticketOrderId: orderId,
                                                    ticketPrice: priceRecieved,
                                                    ticketPurchaseDate:
                                                        purchaseDate));
                                      },
                                      child: Container(
                                        height: 30,
                                        width: 150,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: Color(0xff6CE46C),
                                        ),
                                        child: const Center(
                                            child: Text(
                                          'Running',
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500),
                                        )),
                                      ),
                                    )
                                  : const Text(
                                      'TICKET ERROR: Please contact babuland customer service',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: Colors.red),
                                    ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: expDate == null ||
                        expDate.isAfter(DateTime.now()) && isAvailed == 0 ||
                        isAvailed == null &&
                            startDate != null &&
                            startDate.isBefore(DateTime.now())
                    ? MainAxisAlignment.spaceBetween
                    : MainAxisAlignment.center,
                children: [
                  expDateFormat != null
                      ? Text(
                          'Expire Date : $expDateFormat',
                          style: const TextStyle(
                              fontSize: 12,
                              color: Colors.red,
                              fontWeight: FontWeight.w500),
                        )
                      : const SizedBox(height: 20),
                  const SizedBox(height: 1),
                ],
              ),
              Row(
                mainAxisAlignment: expDate == null ||
                        expDate.isAfter(DateTime.now()) && isAvailed == 0 ||
                        isAvailed == null &&
                            startDate != null &&
                            startDate.isBefore(DateTime.now())
                    ? MainAxisAlignment.spaceBetween
                    : MainAxisAlignment.center,
                children: [
                  Text(
                    'Purchase Date : $purchaseDate',
                    style: const TextStyle(
                        fontSize: 12, fontWeight: FontWeight.w500),
                  ),
                  expDate == null ||
                          expDate.isAfter(DateTime.now()) && isAvailed == 0 ||
                          isAvailed == null &&
                              startDate != null &&
                              startDate.isBefore(DateTime.now())
                      ? InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, 'myTicketInvoicePage',
                                arguments: MyTicketInvoicePageArguments(
                                    discountCoupon: discountCoupon,
                                    discountAmount: priceDiscount,
                                    ticketUnixTimeStamp: orderUnixTimeStamp,
                                    ticketOrderId: orderId,
                                    ticketPrice: priceRecieved,
                                    ticketPurchaseDate: purchaseDate));
                          },
                          child: SizedBox(
                              child: Row(
                            children: [
                              Text(
                                'See Details',
                                style: TextStyle(
                                  color: AppColors.primaryColor,
                                ),
                              ),
                              const SizedBox(width: 5),
                              Container(
                                width: 22.5,
                                height: 22.5,
                                decoration: BoxDecoration(
                                    color: AppColors.primaryColor,
                                    borderRadius: BorderRadius.circular(50)),
                                child: const Center(
                                    child: Icon(
                                  Icons.arrow_forward,
                                  size: 18,
                                  color: Colors.white,
                                )),
                              )
                            ],
                          )),
                        )
                      : const SizedBox(height: 1),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
