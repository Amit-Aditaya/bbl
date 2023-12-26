import 'package:flutter/material.dart';
import 'package:flutter_babuland_app/theme_helpers/colors.dart';

class ProfilePageMembershipInfo extends StatelessWidget {
  final String membershipStatus;
  final int numberOfMemberships;

  const ProfilePageMembershipInfo({
    Key? key,
    required this.membershipStatus,
    required this.numberOfMemberships,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 120,
      width: double.infinity,
      color: Colors.transparent,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 3),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              membershipStatus,
              style: TextStyle(color: AppColors.textGrey2),
            ),
          ),
          const SizedBox(height: 5),
          numberOfMemberships == 0
              ? const SizedBox(height: 7.5)
              : Center(
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, 'activeMemberhsipPage');
                    },
                    child: Container(
                      height: 35,
                      width: double.infinity,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 13, vertical: 7.5),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border:
                            Border.all(width: 2, color: AppColors.primaryColor),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Text(
                          'Membership Details',
                          style: TextStyle(
                              color: AppColors.primaryColor,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ),
          Center(
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, 'membershipPage');
              },
              child: Container(
                height: 35,
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 13),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(width: 2, color: AppColors.primaryColor),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Text(
                    numberOfMemberships == 0 ? 'Buy Membership' : 'Renew',
                    style: TextStyle(
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
