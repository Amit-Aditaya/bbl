import 'package:flutter/material.dart';
import 'package:flutter_babuland_app/theme_helpers/colors.dart';

class TicketDetailsCardRow extends StatelessWidget {
  String ticketItem;
  String price;
  int qty;
  String total;
  TicketDetailsCardRow({
    Key? key,
    required this.ticketItem,
    required this.price,
    required this.qty,
    required this.total,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            height: 25,
            width: 40,
            color: Colors.transparent,
            child: Center(
              child: Text(
                ticketItem.split(' ').first,
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
                price.toString(),
                style: TextStyle(color: AppColors.primaryColor),
              ),
            ),
          ),
          SizedBox(
            height: 25,
            width: 40,
            //color: Colors.green,
            child: Center(
              child: Text(
                'x',
                style: TextStyle(color: AppColors.textGrey2),
              ),
            ),
          ),
          SizedBox(
            height: 25,
            width: 40,
            // color: Colors.green,
            child: Center(
              child: Text(
                qty.toString(),
                style: TextStyle(color: AppColors.primaryColor),
              ),
            ),
          ),
          SizedBox(
            height: 25,
            width: 40,
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
                total.toString(),
                style: TextStyle(color: AppColors.primaryColor),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
