import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_babuland_app/bloc/ticket_order_item/ticket_order_item_bloc.dart';
import 'package:flutter_babuland_app/custom_widgets/my_ticket_container.dart';
import 'package:flutter_babuland_app/data/repository/ticket_order_item_repository.dart';
import 'package:flutter_babuland_app/theme_helpers/colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart';
import 'package:qr_flutter/qr_flutter.dart';

class MyTicketInvoicePage extends StatelessWidget {
  final int ticketOrderId;
  final int ticketOrderPrice;
  final String ticketOrderPurchaseDate;
  final String? ticketOrderUnixTimeStamp;
  final int priceDiscount;

  final String? discountCoupon;

  String? dateFormat;

  MyTicketInvoicePage({
    Key? key,
    required this.priceDiscount,
    required this.ticketOrderId,
    required this.ticketOrderPrice,
    required this.ticketOrderPurchaseDate,
    required this.ticketOrderUnixTimeStamp,
    required this.discountCoupon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (ticketOrderUnixTimeStamp != null) {
      dateFormat = DateFormat('dd/MMM/yyyy').format(
          DateTime.fromMillisecondsSinceEpoch(
              int.parse(ticketOrderUnixTimeStamp!)));
    }

    return BlocProvider(
      create: (context) => TicketOrderItemBloc(
          RepositoryProvider.of<TicketOrderItemRepository>(context),
          ticketOrderId)
        ..add(LoadTicketOrderItemApiEvent()),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text(
            'My Tickets',
            style: TextStyle(color: AppColors.primaryColor),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
              Navigator.pop(context);
              Navigator.pushNamed(context, 'validTicketsPage');
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: AppColors.primaryColor,
            ),
          ),
        ),
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xffffffff),
                  Color(0xffffd194),
                ]),
          ),
          child: Stack(
            children: [
              BlocBuilder<TicketOrderItemBloc, TicketOrderItemState>(
                builder: (context, state) {
                  if (state is TicketOrderItemLoadedState) {
                    return ListView.builder(
                        itemCount: state.ticketOrderItemModel.items.length,
                        itemBuilder: (context, index) {
                          return MyTicketContainer(
                            orderItemId:
                                state.ticketOrderItemModel.items[index].pk,
                            ticketItemType:
                                state.ticketOrderItemModel.items[index].dsc,
                            price: state.ticketOrderItemModel.items[index].mrp,
                            ticketItemqty:
                                state.ticketOrderItemModel.items[index].qty,
                            isAvailed: state
                                .ticketOrderItemModel.items[index].appAvail,
                          );
                        });
                  } else {
                    return Center(
                        child: SpinKitFadingGrid(
                      color: AppColors.primaryColor,
                    ));
                  }
                },
              ),
              DraggableScrollableSheet(
                initialChildSize: 0.35,
                minChildSize: 0.08,
                maxChildSize: 0.8,
                builder:
                    (BuildContext context, ScrollController scrollController) {
                  return Container(
                    color: Colors.white,
                    child: SingleChildScrollView(
                      controller: scrollController,
                      child: Container(
                        height: 500,
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
                            const Text(
                              'Scan QR code to avail ticket',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(height: 7.5),
                            Row(
                              children: [
                                Container(
                                    height: 200,
                                    width:
                                        MediaQuery.of(context).size.width * .5,
                                    color: Colors.transparent,
                                    padding:
                                        const EdgeInsets.only(left: 20, top: 5),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const SizedBox(height: 2.5),
                                        Text(
                                          'Order ID',
                                          style: TextStyle(
                                            color: AppColors.textGrey2,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        Text(
                                          ticketOrderId.toString(),
                                          style: TextStyle(
                                            color: AppColors.primaryColor,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        Text(
                                          'Ticket Purchase Date',
                                          style: TextStyle(
                                            color: AppColors.textGrey2,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        FittedBox(
                                          child: Text(
                                            ticketOrderPurchaseDate,
                                            style: TextStyle(
                                              color: AppColors.primaryColor,
                                              fontWeight: FontWeight.w600,
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
                                          dateFormat == null
                                              ? 'None'
                                              : '$dateFormat',
                                          style: TextStyle(
                                            color: AppColors.primaryColor,
                                            fontWeight: FontWeight.w600,
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
                                          '$ticketOrderPrice৳',
                                          style: TextStyle(
                                            color: AppColors.primaryColor,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    )),
                                Expanded(
                                  child: Container(
                                    height: 175,
                                    color: Colors.transparent,
                                    child: Center(
                                      child: QrImage(
                                        data: ticketOrderId.toString(),
                                        size: 155,
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
                            priceDiscount != 0
                                ? Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: const [
                                            Text(
                                              'Discount Details',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 16),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 7.5,
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              'Coupon:  ',
                                              style: TextStyle(
                                                  color: AppColors.textGrey2,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            Text(
                                              discountCoupon ?? 'None',
                                              style: TextStyle(
                                                color: AppColors.primaryColor,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              'Order Price:  ',
                                              style: TextStyle(
                                                  color: AppColors.textGrey2,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            Text(
                                              '${priceDiscount + ticketOrderPrice}৳',
                                              style: TextStyle(
                                                  color: AppColors.primaryColor,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              'Discount:  ',
                                              style: TextStyle(
                                                  color: AppColors.textGrey2,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            Text(
                                              '${priceDiscount}৳',
                                              style: TextStyle(
                                                  color: AppColors.primaryColor,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  )
                                : Text(''),
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
      ),
    );
  }
}
