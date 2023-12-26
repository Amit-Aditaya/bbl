import 'package:flutter/material.dart';
import 'package:flutter_babuland_app/theme_helpers/colors.dart';

class ActiveMembershipCard extends StatelessWidget {
  //const ActiveMembershipCard({Key? key}) : super(key: key);
  final Color color;
  final String expireDate;
  final String purchaseDate;
  final String childName;
  final String packageName;
  final int packagePrice;
  const ActiveMembershipCard({
    Key? key,
    required this.color,
    required this.expireDate,
    required this.purchaseDate,
    required this.childName,
    required this.packageName,
    required this.packagePrice,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var difference = calculateMembershipDuration();
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            width: 3,
            color: color,
          ),
          color: Colors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            height: 50,
            decoration: BoxDecoration(
              color: color,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(13),
                topRight: Radius.circular(13),
              ),
            ),
            child: Center(
              child: Text(
                packageName,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const SizedBox(height: 5),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            margin: const EdgeInsets.symmetric(horizontal: 1),
            width: double.infinity,
            height: 20,
            color: Colors.transparent,
            child: RichText(
              text: TextSpan(
                  text: 'Child Name: \t',
                  style: const TextStyle(color: Colors.black, fontSize: 15),
                  children: [
                    TextSpan(
                      text: childName,
                      style: TextStyle(
                        color: AppColors.textGrey2,
                      ),
                    ),
                  ]),
            ),
          ),
          const SizedBox(height: 5),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            margin: const EdgeInsets.symmetric(horizontal: 1),
            width: double.infinity,
            height: 20,
            color: Colors.transparent,
            child: RichText(
              text: TextSpan(
                text: 'Price: \t',
                style: const TextStyle(color: Colors.black, fontSize: 15),
                children: [
                  TextSpan(
                    text: '${packagePrice}tk',
                    style: TextStyle(
                      color: AppColors.textGrey2,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 5),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            margin: const EdgeInsets.symmetric(horizontal: 1),
            width: double.infinity,
            height: 20,
            color: Colors.transparent,
            child: RichText(
              text: TextSpan(
                  text: 'Duration: \t',
                  style: const TextStyle(color: Colors.black, fontSize: 15),
                  children: [
                    TextSpan(
                      text: '${difference.toString()} Days',
                      style: TextStyle(
                        color: AppColors.textGrey2,
                      ),
                    ),
                  ]),
            ),
          ),
          const SizedBox(height: 5),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            margin: const EdgeInsets.symmetric(horizontal: 1),
            width: double.infinity,
            height: 20,
            color: Colors.transparent,
            child: RichText(
              text: TextSpan(
                  text: 'Date Purchased: \t',
                  style: const TextStyle(color: Colors.black, fontSize: 15),
                  children: [
                    TextSpan(
                      text: purchaseDate,
                      style: TextStyle(
                        color: AppColors.primaryGreen,
                      ),
                    ),
                  ]),
            ),
          ),
          const SizedBox(height: 5),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            margin: const EdgeInsets.symmetric(horizontal: 1),
            width: double.infinity,
            height: 20,
            color: Colors.transparent,
            child: RichText(
              text: TextSpan(
                text: 'Expire Date: \t',
                style: const TextStyle(color: Colors.black, fontSize: 15),
                children: [
                  TextSpan(
                    text: expireDate,
                    style: TextStyle(
                      color: AppColors.primaryRed,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 15),
        ],
      ),
    );
  }

  calculateMembershipDuration() {
    String pDate = purchaseDate.substring(0, 2);
    int pd = int.parse(pDate);
    String pMonth = purchaseDate.substring(3, 5);
    int pm = int.parse(pMonth);
    String pYear = purchaseDate.substring(6, 10);
    int py = int.parse(pYear);

    DateTime purchased = DateTime(py, pm, pd);

    String eDate = expireDate.substring(0, 2);
    int ed = int.parse(eDate);
    String eMonth = expireDate.substring(3, 5);
    int em = int.parse(eMonth);
    String eYear = expireDate.substring(6, 10);
    int ey = int.parse(eYear);

    DateTime expired = DateTime(ey, em, ed);

    var difference = expired.difference(purchased).inDays;
    return difference;
  }
}
