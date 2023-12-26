import 'package:custom_clippers/Clippers/ticket_pass_clipper.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_babuland_app/custom_classes/ticket_details_page_arguments.dart';
import 'package:flutter_babuland_app/custom_widgets/ticket_container.dart';
import 'package:flutter_babuland_app/custom_widgets/ticket_item_container.dart';
import 'package:flutter_babuland_app/data/model/free_ticket_model.dart';
import 'package:flutter_babuland_app/theme_helpers/colors.dart';
import 'package:flutter_babuland_app/views/free_tickets_page.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class Ticket extends StatelessWidget {
  final Item freeTicketItem;
  const Ticket({
    Key? key,
    required this.freeTicketItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateTime expDate = DateTime.fromMillisecondsSinceEpoch(
        int.parse(freeTicketItem.expairDate));

    String date = DateFormat('dd-MMM-yyyy').format(expDate);

    var inputFormat = DateFormat('MM/dd/yyyy');
    var date1 = inputFormat.parse(freeTicketItem.addedDate);

    var outputFormat = DateFormat('dd/MMM/yyyy');
    var date2 = outputFormat.format(date1);
    var addedDate = date2.replaceAll('/', '-');

    return ClipPath(
      clipper: TicketPassClipper(
        position: MediaQuery.of(context).size.width * .36,
        holeRadius: 30,
      ),
      child: Container(
        height: 185,
        width: double.infinity,

        color: AppColors.ticketYellow.withOpacity(.85),
        //color: Color(0xffFBFFB0),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10.5),
              alignment: Alignment.bottomCenter,
              color: Colors.transparent,
              height: 15,
              child: Container(
                height: 5,
                child: Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * .5,
                      color: AppColors.primaryGreen,
                    ),
                    Expanded(
                      child: Container(
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.transparent,
                padding: const EdgeInsets.symmetric(horizontal: 5),
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    VerticalDivider(
                      thickness: 5,
                      color: AppColors.primaryColor,
                    ),
                    Container(
                      width: 80,
                      color: Colors.transparent,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.all(5),
                            color: Colors.transparent,
                            child: SvgPicture.asset(
                              'assets/images/logo_svg.svg',
                              height: 40,
                              width: 40,
                              fit: BoxFit.scaleDown,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            'Uttara',
                            style: TextStyle(
                              color: AppColors.textGrey,
                              fontSize: 10,
                            ),
                          ),
                          Divider(
                            thickness: 1,
                            height: 7,
                            indent: 15,
                            endIndent: 15,
                            color: AppColors.primaryColor,
                          ),
                          Text(
                            'Wari',
                            style: TextStyle(
                              color: AppColors.textGrey,
                              fontSize: 10,
                            ),
                          ),
                          Divider(
                            thickness: 1,
                            indent: 15,
                            height: 7,
                            endIndent: 15,
                            color: AppColors.primaryColor,
                          ),
                          Text(
                            'Badda',
                            style: TextStyle(
                              color: AppColors.textGrey,
                              fontSize: 10,
                            ),
                          ),
                          Divider(
                            thickness: 1,
                            height: 7,
                            indent: 15,
                            endIndent: 15,
                            color: AppColors.primaryColor,
                          ),
                          Text(
                            'Mirpur',
                            style: TextStyle(
                              color: AppColors.textGrey,
                              fontSize: 10,
                            ),
                          ),
                          Divider(
                            thickness: 1,
                            indent: 15,
                            height: 7,
                            endIndent: 15,
                            color: AppColors.primaryColor,
                          ),
                        ],
                      ),
                    ),
                    const DottedLine(
                      direction: Axis.vertical,
                      lineLength: double.infinity,
                      dashColor: Colors.white,
                      lineThickness: 3,
                      dashRadius: 4,
                    ),
                    Container(
                      width: 170,
                      color: Colors.transparent,
                      child: Column(
                        children: [
                          const SizedBox(height: 10),
                          Text(
                            freeTicketItem.productName,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                fontSize: 13, fontWeight: FontWeight.w500),
                          ),
                          Text(
                            'SL NO: ${freeTicketItem.fstId.toString()}',
                            style: TextStyle(
                                fontSize: 11, color: AppColors.textGrey),
                          ),
                          const SizedBox(height: 7.5),
                          expDate.isBefore(DateTime.now()) &&
                                  freeTicketItem.avil == 'N'
                              ? Container(
                                  height: 40,
                                  width: 90,
                                  decoration: BoxDecoration(
                                      color: Colors.transparent,
                                      border: Border.all(
                                          color: Colors.red, width: 4),
                                      borderRadius: BorderRadius.circular(40)),
                                  child: const Center(
                                    child: Text(
                                      'Expired',
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.red),
                                    ),
                                  ),
                                )
                              : expDate.isBefore(DateTime.now()) &&
                                      freeTicketItem.avil == 'Y'
                                  ? Container(
                                      height: 40,
                                      width: 90,
                                      decoration: BoxDecoration(
                                          color: Colors.transparent,
                                          border: Border.all(
                                              color: Colors.grey, width: 4),
                                          borderRadius:
                                              BorderRadius.circular(40)),
                                      child: const Center(
                                        child: Text(
                                          'Used',
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.grey),
                                        ),
                                      ),
                                    )
                                  : expDate.isAfter(DateTime.now()) &&
                                          freeTicketItem.avil == 'Y'
                                      ? Container(
                                          height: 40,
                                          width: 90,
                                          decoration: BoxDecoration(
                                              color: Colors.transparent,
                                              border: Border.all(
                                                  color: Colors.blue, width: 4),
                                              borderRadius:
                                                  BorderRadius.circular(40)),
                                          child: const Center(
                                            child: Text(
                                              'Running',
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.blue),
                                            ),
                                          ),
                                        )
                                      : InkWell(
                                          onTap: () {
                                            FreeTicketsPage
                                                    .selectedTicketExpireDate =
                                                freeTicketItem.expairDate;
                                            FreeTicketsPage
                                                .selectedFreeTicketItemList
                                                .add(TicketItemContainer(
                                                    ticketItemId: freeTicketItem
                                                        .fstId, // different for free tickets and paid tickets
                                                    ticketName: freeTicketItem
                                                                .productName
                                                                .contains(
                                                                    'Child') ||
                                                            freeTicketItem
                                                                .productName
                                                                .contains(
                                                                    'CHILD') ||
                                                            freeTicketItem
                                                                .productName
                                                                .contains(
                                                                    'Chaild') ||
                                                            freeTicketItem
                                                                .productName
                                                                .contains(
                                                                    'CHAILD')
                                                        ? 'Child(Free)'
                                                        : 'Guardian(Free)',
                                                    price: 0,
                                                    description: '',
                                                    ticketQty: 1));

                                            Navigator.pushNamed(
                                                context, 'ticketDetailsPage',
                                                arguments: TicketDetailsPageArguments(
                                                    ticketContainer:
                                                        TicketContainer(
                                                            freeTicketItem:
                                                                freeTicketItem),
                                                    list: FreeTicketsPage
                                                        .selectedFreeTicketItemList));

                                            // FreeTicketsPage.freeTicketItems
                                            //     .add(freeTicketItem);

                                            // print(FreeTicketsPage.freeTicketItems);
                                            // print(FreeTicketsPage
                                            //     .freeTicketItems.first.productName);
                                          },
                                          child: Container(
                                            height: 40,
                                            width: 90,
                                            decoration: BoxDecoration(
                                                color: Colors.transparent,
                                                border: Border.all(
                                                    color:
                                                        AppColors.primaryGreen,
                                                    width: 4),
                                                borderRadius:
                                                    BorderRadius.circular(40)),
                                            child: Center(
                                              child: Text(
                                                'Avail Ticket',
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.bold,
                                                    color:
                                                        AppColors.primaryGreen),
                                              ),
                                            ),
                                          ),
                                        ),
                          const SizedBox(height: 7.5),
                          // Text(
                          //   'Paid Amount: 500tk',
                          //   style: TextStyle(
                          //       fontSize: 10, color: AppColors.textGrey),
                          // ),
                          Text(
                            //'Date Received: ${freeTicketItem.addedDate.replaceAll('/', '-')}',
                            'Date Received: $addedDate',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 11, color: AppColors.textGrey),
                          ),
                          //const SizedBox(height: 2),
                          Text(
                            'Expire Date: $date',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 11, color: AppColors.textGrey),
                          ),
                        ],
                      ),
                    ),
                    // Flexible(
                    //   child: Container(
                    //     //width: 65,
                    //     color: Colors.transparent,
                    //     child: Column(
                    //       children: [
                    //         Spacer(),
                    //         Container(
                    //           //height: 50,
                    //           margin: EdgeInsets.all(5),
                    //           color: Colors.transparent,
                    //           child: SvgPicture.asset(
                    //             'assets/images/barcode-scanner.svg',
                    //             height: 45,
                    //             width: 45,
                    //             fit: BoxFit.scaleDown,
                    //           ),
                    //         ),
                    //         Spacer(),
                    //         Container(
                    //           //height: 50,
                    //           margin: EdgeInsets.all(5),
                    //           color: Colors.transparent,
                    //           child: SvgPicture.asset(
                    //             'assets/images/tickets.svg',
                    //             height: 45,
                    //             width: 45,
                    //             fit: BoxFit.scaleDown,
                    //           ),
                    //         ),
                    //         Spacer(),
                    //       ],
                    //     ),
                    //   ),
                    // ),
                    VerticalDivider(
                      thickness: 5,
                      color: AppColors.primaryBlue,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10.5),
              alignment: Alignment.topCenter,
              color: Colors.transparent,
              height: 15,
              child: Container(
                height: 5,
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        color: AppColors.primaryPurple,
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * .5,
                      color: AppColors.primaryPink,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
