import 'package:flutter/material.dart';
import 'package:flutter_babuland_app/theme_helpers/colors.dart';

class TicketDetailsCardTotalRow extends StatelessWidget {
  //const TicketDetailsCardTotalRow({Key? key}) : super(key: key);
  String totalType;
  String total;
  TicketDetailsCardTotalRow({
    Key? key,
    required this.totalType,
    required this.total,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(
          height: 25,
          width: 40,
          //color: Colors.green,
          child: Center(
            child: Text(
              totalType,
              style: TextStyle(color: AppColors.textGrey2),
              overflow: TextOverflow.visible,
              softWrap: false,
            ),
          ),
        ),
        const SizedBox(width: 40),
        SizedBox(
          height: 25,
          width: 40,
          //color: Colors.green,
          child: Center(
            child: Text(
              '',
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
              '',
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
              '',
              style: TextStyle(color: AppColors.textGrey2),
            ),
          ),
        ),
        SizedBox(
          height: 25,
          width: 40,
          child: Center(
            child: Text(
              total,
              overflow: TextOverflow.visible,
              softWrap: false,
              style: TextStyle(color: AppColors.primaryColor),
            ),
          ),
        ),
      ],
    );
  }
}
