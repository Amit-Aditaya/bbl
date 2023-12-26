import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_babuland_app/custom_widgets/ticket_item_container.dart';
import 'package:flutter_babuland_app/theme_helpers/colors.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

class TicketDetailsCard2 extends StatelessWidget {
  final Set<TicketItemContainer> list;

  static int grandTotal = 0;

  static int discountPct = 0;

  static String? couponName;

  const TicketDetailsCard2({
    Key? key,
    required this.list,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    grandTotal = calculateGrandTotal();
    return ClipPath(
      clipBehavior: Clip.hardEdge,
      clipper: MultipleRoundedCurveClipper(),
      child: Container(
        padding: const EdgeInsets.only(bottom: 15),
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
            Card(
              color: Colors.white,
              elevation: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 25,
                    width: 40,
                    color: Colors.transparent,
                    child: Center(
                      child: Text(
                        '',
                        overflow: TextOverflow.visible,
                        softWrap: false,
                        style: TextStyle(color: AppColors.textGrey2),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                    width: 40,
                    // color: Colors.green,
                  ),
                  const SizedBox(
                    height: 25,
                    width: 40,
                    //color: Colors.green,
                    child: Center(
                      child: Text(
                        'Price',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                    width: 15,
                    //color: Colors.green,
                    child: Center(
                      child: Text(
                        '',
                        style: TextStyle(color: AppColors.textGrey2),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                    width: 50,
                    // color: Colors.green,
                    child: Center(
                      child: Text(
                        'Quantity',
                        style: TextStyle(color: Colors.black),
                        overflow: TextOverflow.visible,
                        softWrap: false,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                    width: 25,
                    //color: Colors.green,
                    child: Center(
                      child: Text(
                        '',
                        style: TextStyle(color: AppColors.textGrey2),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                    width: 40,
                    //color: Colors.green,
                    child: Center(
                      child: Text(
                        'Total',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: List.generate(
                  list.length,
                  (index) => Card(
                        elevation: 0,
                        color: Colors.white,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              height: 25,
                              width: 40,
                              color: Colors.transparent,
                              child: Center(
                                child: Text(
                                  list
                                      .elementAt(index)
                                      .ticketName
                                      .split(' ')
                                      .first, /////
                                  overflow: TextOverflow.visible,
                                  softWrap: false,
                                  style: TextStyle(color: AppColors.textGrey2),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 25,
                              width: 40,
                              // color: Colors.green,
                            ),
                            SizedBox(
                              height: 25,
                              width: 40,
                              //color: Colors.green,
                              child: Center(
                                child: Text(
                                  list.elementAt(index).price.toString(),
                                  style:
                                      TextStyle(color: AppColors.primaryColor),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 25,
                              width: 25,
                              //color: Colors.green,
                              child: Center(
                                child: Text(
                                  'x',
                                  style: TextStyle(color: AppColors.textGrey2),
                                ),
                              ),
                            ),
                            Container(
                              height: 25,
                              width: 40,
                              decoration: const BoxDecoration(
                                color: Colors.transparent,
                              ),
                              child: Center(
                                child: Text(
                                  list.elementAt(index).ticketQty.toString(),
                                  style:
                                      TextStyle(color: AppColors.primaryColor),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 25,
                              width: 25,
                              //color: Colors.green,
                              child: Center(
                                child: Text(
                                  '=',
                                  style: TextStyle(color: AppColors.textGrey2),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 25,
                              width: 40,
                              //color: Colors.green,
                              child: Center(
                                child: Text(
                                  (list.elementAt(index).price *
                                              list.elementAt(index).ticketQty)
                                          .toString() +
                                      '৳',
                                  overflow: TextOverflow.visible,
                                  softWrap: false,
                                  style:
                                      TextStyle(color: AppColors.primaryColor),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )),
            ),
            const DottedLine(
              dashColor: Color(0xffEBECF0),
              lineThickness: 3,
            ),
            discountPct != 0
                ? Card(
                    color: Colors.white,
                    elevation: 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: 25,
                          width: 40,
                          color: Colors.transparent,
                          child: const Center(
                            child: Text(
                              'Sub Total',
                              overflow: TextOverflow.visible,
                              softWrap: false,
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 25,
                          width: 40,
                        ),
                        const SizedBox(
                          height: 25,
                          width: 25,
                          child: Center(
                            child: Text(
                              '',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 25,
                          width: 40,
                          child: Center(
                            child: Text(
                              '',
                              style: TextStyle(color: AppColors.textGrey2),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 25,
                          width: 40,
                          // color: Colors.green,
                          child: Center(
                            child: Text(
                              '',
                              style: TextStyle(color: Colors.black),
                              overflow: TextOverflow.visible,
                              softWrap: false,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 25,
                          width: 25,
                          //color: Colors.green,
                          child: Center(
                            child: Text(
                              '',
                              style: TextStyle(color: AppColors.textGrey2),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 25,
                          width: 40,
                          //color: Colors.green,
                          child: Center(
                            child: Text(
                              '${calculateGrandTotal()}৳',
                              overflow: TextOverflow.visible,
                              softWrap: false,
                              style: TextStyle(
                                  color: AppColors.primaryRed,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                : SizedBox(),
            discountPct != 0
                ? Card(
                    color: Colors.white,
                    elevation: 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: 25,
                          width: 40,
                          color: Colors.transparent,
                          child: const Center(
                            child: Text(
                              'Discount',
                              overflow: TextOverflow.visible,
                              softWrap: false,
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 25,
                          width: 40,
                        ),
                        const SizedBox(
                          height: 25,
                          width: 25,
                          child: Center(
                            child: Text(
                              '',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 25,
                          width: 40,
                          child: Center(
                            child: Text(
                              '',
                              style: TextStyle(color: AppColors.textGrey2),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 25,
                          width: 40,
                          // color: Colors.green,
                          child: Center(
                            child: Text(
                              '',
                              style: TextStyle(color: Colors.black),
                              overflow: TextOverflow.visible,
                              softWrap: false,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 25,
                          width: 25,
                          //color: Colors.green,
                          child: Center(
                            child: Text(
                              '',
                              style: TextStyle(color: AppColors.textGrey2),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 25,
                          width: 40,
                          //color: Colors.green,
                          child: Center(
                            child: Text(
                              '-${(grandTotal * (discountPct / 100)).toStringAsFixed(0)}৳',
                              overflow: TextOverflow.visible,
                              softWrap: false,
                              style: TextStyle(
                                  color: AppColors.primaryRed,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                : const SizedBox(),
            Card(
              color: Colors.white,
              elevation: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 25,
                    width: 40,
                    color: Colors.transparent,
                    child: const Center(
                      child: Text(
                        'Grand Total',
                        overflow: TextOverflow.visible,
                        softWrap: false,
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                    width: 40,
                  ),
                  const SizedBox(
                    height: 25,
                    width: 25,
                    child: Center(
                      child: Text(
                        '',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                    width: 40,
                    child: Center(
                      child: Text(
                        '',
                        style: TextStyle(color: AppColors.textGrey2),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                    width: 40,
                    // color: Colors.green,
                    child: Center(
                      child: Text(
                        '',
                        style: TextStyle(color: Colors.black),
                        overflow: TextOverflow.visible,
                        softWrap: false,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                    width: 25,
                    //color: Colors.green,
                    child: Center(
                      child: Text(
                        '',
                        style: TextStyle(color: AppColors.textGrey2),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                    width: 40,
                    //color: Colors.green,
                    child: Center(
                      child: Text(
                        discountPct == 0
                            ? '${calculateGrandTotal()}৳'
                            : '${calculateGrandTotal() - (grandTotal * (discountPct / 100)).toInt()}৳',
                        overflow: TextOverflow.visible,
                        softWrap: false,
                        style: TextStyle(
                            color: AppColors.primaryRed,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  calculateGrandTotal() {
    int total = 0;
    for (int i = 0; i < list.length; i++) {
      var x = list.elementAt(i).price * list.elementAt(i).ticketQty;
      total = total + x;
    }

    return total;
  }
}
