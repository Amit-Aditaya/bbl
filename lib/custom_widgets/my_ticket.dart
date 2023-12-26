import 'package:custom_clippers/Clippers/ticket_pass_clipper.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_babuland_app/theme_helpers/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:qr_flutter/qr_flutter.dart';

class MyTicket extends StatelessWidget {
//  const Ticket({Key? key}) : super(key: key);
  final int orderItemId;
  final String title;
  final int price;
  final int qty;
  final String? isAvailed;

  const MyTicket({
    Key? key,
    required this.orderItemId,
    required this.title,
    required this.price,
    required this.qty,
    required this.isAvailed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (title.contains('VR') || title.contains('Chair')) {
          if (isAvailed == 'Y' || isAvailed == 'y') {
            //print('already aviled');
          } else {
            showDialog(
                context: context,
                builder: ((context) => AlertDialog(
                      title: Text(
                        'Scan QR code to avail $title',
                        style: TextStyle(
                            fontSize: 18, color: AppColors.primaryColor),
                        textAlign: TextAlign.center,
                      ),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'ID: $orderItemId',
                            style: TextStyle(
                                color: AppColors.textGrey2, fontSize: 16),
                          ),
                          SizedBox(
                            height: 200,
                            width: 200,
                            child: Center(
                              child: QrImage(
                                data: orderItemId.toString(),
                                size: 175,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )));
          }
        } else {}
      },
      child: ClipPath(
        clipper: TicketPassClipper(
          position: MediaQuery.of(context).size.width * .36,
          holeRadius: 30,
        ),
        child: Container(
          height: 185,
          width: double.infinity,
          color: isAvailed == 'Y' || isAvailed == 'y'
              ? Color(0xffDEDBDB)
              : AppColors.ticketYellow2,
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
                            isAvailed == 'Y' || isAvailed == 'y'
                                ? Container(
                                    //  margin: const EdgeInsets.all(5),
                                    color: Colors.transparent,
                                    child: SvgPicture.asset(
                                      'assets/images/used_stamp.svg',
                                      height: 60,
                                      width: 60,
                                      fit: BoxFit.scaleDown,
                                    ),
                                  )
                                : Column(
                                    children: [
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
                              '$title Ticket',
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                            Text(
                              'SL N0: $orderItemId',
                              style: TextStyle(
                                  fontSize: 13, color: AppColors.textGrey),
                            ),
                            const SizedBox(height: 7.5),
                            Text(
                              'Quantity: $qty',
                              style: TextStyle(
                                  fontSize: 15, color: AppColors.primaryRed),
                            ),
                            const SizedBox(height: 3),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 7.5, vertical: 2.5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: AppColors.primaryGreen,
                              ),
                              child: Text(
                                'Price: ${price}৳',
                                style: const TextStyle(
                                    fontSize: 15, color: Colors.white),
                              ),
                            ),
                            const SizedBox(height: 7.5),
                          ],
                        ),
                      ),
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
      ),
    );
  }
}
