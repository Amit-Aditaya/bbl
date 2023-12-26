import 'package:flutter/material.dart';
import 'package:flutter_babuland_app/custom_widgets/ticket_container.dart';
import 'package:flutter_babuland_app/custom_widgets/ticket_item_container.dart';
import 'package:flutter_babuland_app/theme_helpers/colors.dart';
import 'package:flutter_babuland_app/views/free_tickets_page.dart';
import 'package:flutter_babuland_app/views/my_tickets_page.dart';
import 'package:intl/intl.dart';
import 'package:qr_flutter/qr_flutter.dart';

class TicketDetailsPage extends StatelessWidget {
  //const TicketDetailsPage({Key? key}) : super(key: key);
  TicketContainer freeTicketContainer;

  final Set<TicketItemContainer> ticketItemList;
  TicketDetailsPage({
    Key? key,
    required this.freeTicketContainer,
    required this.ticketItemList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // var dateFormat = DateTime.fromMillisecondsSinceEpoch(
    //     int.parse(freeTicketContainer.freeTicketItem.expairDate));
    // String dateTime = dateFormat.toString();
    // String date = dateTime.split(' ')[0];

    // var dformat = DateFormat('dd-MMM-yyyy').format(dateFormat);

    String dateFormat = DateFormat('dd-MMM-yyyy').format(
        DateTime.fromMillisecondsSinceEpoch(
            int.parse(freeTicketContainer.freeTicketItem.expairDate)));

    String date = dateFormat.split(' ')[0];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Ticket Details',
          style: TextStyle(color: AppColors.primaryColor),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: InkWell(
          onTap: () {
            FreeTicketsPage.selectedFreeTicketItemList.clear();
            MyTicketsPage.selectedMyTicketItemList.clear();
            Navigator.pop(context);
            Navigator.pop(context);
            Navigator.pushNamed(context, 'freeTicketsPage');
          },
          child: Icon(
            Icons.arrow_back,
            color: AppColors.primaryColor,
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: Container(
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                // Color(0xffFDC830),
                // Color(0xffF37335),
                Color(0xffffffff),
                Color(0xffffd194),
              ]),
        ),
        child: Stack(
          children: [
            Column(
              children: [
                const SizedBox(height: 50),
                freeTicketContainer,
              ],
            ),
            DraggableScrollableSheet(
              initialChildSize: 0.35,
              minChildSize: 0.075,
              maxChildSize: 0.8,
              builder:
                  (BuildContext context, ScrollController scrollController) {
                return Container(
                  color: Colors.white,
                  child: SingleChildScrollView(
                    controller: scrollController,
                    child: Container(
                      height: 250,
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      color: Colors.white,
                      child: Column(
                        children: [
                          Container(
                            height: 6,
                            width: 100,
                            margin: const EdgeInsets.only(top: 4),
                            decoration: BoxDecoration(
                                color: AppColors.primaryColor,
                                borderRadius: BorderRadius.circular(50)),
                          ),
                          const SizedBox(height: 7.5),
                          Text(
                            'Scan QR code to avail ticket',
                            style: TextStyle(color: AppColors.textGrey2),
                          ),
                          const SizedBox(height: 7.5),
                          Row(
                            children: [
                              Container(
                                  height: 150,
                                  width: MediaQuery.of(context).size.width * .6,
                                  color: Colors.transparent,
                                  padding:
                                      const EdgeInsets.only(left: 20, top: 5),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(height: 2.5),
                                      Text(
                                        'Ticket Added Date',
                                        style: TextStyle(
                                          color: AppColors.textGrey2,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      FittedBox(
                                        child: Text(
                                          // '${DateTime.fromMillisecondsSinceEpoch(int.parse(FreeTicketsPage.selectedTicketExpireDate!))}',
                                          '${freeTicketContainer.freeTicketItem.addedDate}',
                                          style: TextStyle(
                                            color: AppColors.primaryColor,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        'Ticket Expire Date',
                                        style: TextStyle(
                                          color: AppColors.textGrey2,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      Text(
                                        date,
                                        style: TextStyle(
                                          color: AppColors.primaryColor,
                                        ),
                                      ),
                                      Text(
                                        'Ticket Price',
                                        style: TextStyle(
                                          color: AppColors.textGrey2,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      Text(
                                        'Free',
                                        style: TextStyle(
                                          color: AppColors.primaryColor,
                                        ),
                                      ),
                                    ],
                                  )),
                              Expanded(
                                child: Container(
                                  height: 150,
                                  color: Colors.transparent,
                                  child: Center(
                                    child: QrImage(
                                      data: freeTicketContainer
                                          .freeTicketItem.fstId
                                          .toString(),
                                      size: 150,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 25),
                          const Divider(
                            thickness: 2,
                            indent: 10,
                            endIndent: 10,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
