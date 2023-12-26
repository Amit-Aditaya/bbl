import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_babuland_app/data/model/party_booking_history_model.dart';
import 'package:flutter_babuland_app/theme_helpers/colors.dart';

class PartyHistoryCard extends StatelessWidget {
  //const PartyHistoryCard({Key? key}) : super(key: key);

  final Item partyHistoryItem;
  const PartyHistoryCard({
    Key? key,
    required this.partyHistoryItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 30),
        padding: const EdgeInsets.symmetric(horizontal: 25),
        height: 180,
        width: MediaQuery.of(context).size.width * .8,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.grey.shade300,
            boxShadow: [
              const BoxShadow(
                blurRadius: 15,
                offset: Offset(-5, -5),
                color: Colors.white,
              ),
              BoxShadow(
                blurRadius: 15,
                offset: const Offset(5, 5),
                color: Colors.grey.shade500,
              )
            ]),
        child: Column(
          children: [
            const SizedBox(height: 5),
            Text(
              partyHistoryItem.partyType,
              style: TextStyle(
                color: AppColors.primaryColor,
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 15),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                padding: const EdgeInsets.all(5),
                child: Text(
                  'Branch: ${partyHistoryItem.branch}',
                  style: TextStyle(
                    fontSize: 15,
                    color: AppColors.textGrey2,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            Divider(
              color: AppColors.textGrey2,
              thickness: 1,
            ),
            const SizedBox(height: 7.5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  child: Row(
                    children: [
                      Icon(
                        Icons.calendar_month_outlined,
                        size: 18,
                        color: AppColors.textGrey2,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        partyHistoryItem.partyDate,
                        style: TextStyle(
                          color: AppColors.textGrey2,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  child: Row(
                    children: [
                      Icon(
                        Icons.watch_later_outlined,
                        size: 18,
                        color: AppColors.textGrey2,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        partyHistoryItem.partyTime,
                        style: TextStyle(
                          color: AppColors.textGrey2,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 7.5),
            Divider(
              color: AppColors.textGrey2,
              thickness: 1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  partyHistoryItem.decoration == 'y' ||
                          partyHistoryItem.decoration == 'Y'
                      ? 'Decoration: Yes'
                      : 'Decoration: No',
                  style: TextStyle(color: AppColors.textGrey2, fontSize: 13),
                ),
                Text(
                  'Status: ${partyHistoryItem.pbStatus}',
                  style: TextStyle(color: AppColors.textGrey2, fontSize: 13),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
