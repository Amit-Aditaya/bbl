import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_babuland_app/custom_widgets/app_button.dart';
import 'package:flutter_babuland_app/custom_widgets/branches_radio_button.dart';
import 'package:flutter_babuland_app/custom_widgets/custom_app_bar.dart';
import 'package:flutter_babuland_app/custom_widgets/party_date_time_picker.dart';
import 'package:flutter_babuland_app/custom_widgets/party_type_radio_button.dart';
import 'package:flutter_babuland_app/custom_widgets/yes_no_radio_button.dart';
import 'package:flutter_babuland_app/data/repository/mim_sms_repository.dart';
import 'package:flutter_babuland_app/data/repository/party_booking_history_repository.dart';
import 'package:flutter_babuland_app/theme_helpers/colors.dart';

class PartyBookingPage extends StatelessWidget {
  //const PartyBookingPage({Key? key}) : super(key: key);

  final int customerId;
  final String customerPhoneNumber;
  const PartyBookingPage({
    Key? key,
    required this.customerId,
    required this.customerPhoneNumber,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        backgroundColor: AppColors.primaryColor,
        title: 'Party Booking',
      ),
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        width: double.infinity,
        color: Colors.transparent,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 35),
              const Center(child: CircleAvatar(radius: 50)),
              const SizedBox(height: 15),
              const Center(
                child: Text(
                  'Party Booking',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Divider(
                color: AppColors.textGrey2,
                thickness: 1,
                endIndent: 25,
                indent: 25,
              ),
              const SizedBox(height: 15),
              Text(
                'Party Type',
                style: TextStyle(
                  fontSize: 16,
                  color: AppColors.primaryGreen,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 15),
              const PartyTypeRadioButton(
                initialPartyType: PartyTypeRadioValue.classParty,
              ),
              const SizedBox(height: 15),
              Divider(
                color: AppColors.textGrey2,
                thickness: 1,
                endIndent: 25,
                indent: 25,
              ),
              const SizedBox(height: 15),
              Text(
                'Branch',
                style: TextStyle(
                  fontSize: 16,
                  color: AppColors.primaryPink,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 15),
              const BranchesRadioButtons(
                initialBranch: BranchRadioValue.mirpur,
              ),
              const SizedBox(height: 15),
              Divider(
                color: AppColors.textGrey2,
                thickness: 1,
                endIndent: 25,
                indent: 25,
              ),
              const SizedBox(height: 15),
              Text(
                'Decoration',
                style: TextStyle(
                  fontSize: 16,
                  color: AppColors.primaryPurple,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 15),
              const YesNoradioButton(
                initialYesNoValue: YesNoRadioValue.yes,
              ),
              const SizedBox(height: 15),
              Divider(
                color: AppColors.textGrey2,
                thickness: 1,
                endIndent: 25,
                indent: 25,
              ),
              const SizedBox(height: 15),
              Align(
                alignment: Alignment.centerLeft,
                widthFactor: 3.5,
                child: Text(
                  'Date & Time',
                  style: TextStyle(
                    fontSize: 16,
                    color: AppColors.primaryRed,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const PartyDateTimePicker(),
              const SizedBox(height: 10),
              Divider(
                color: AppColors.textGrey2,
                thickness: 1,
                endIndent: 25,
                indent: 25,
              ),
              const SizedBox(height: 15),
              InkWell(
                onTap: () {
                  if (PartyDateTimePicker.userSelectedDate == null ||
                      PartyDateTimePicker.userSelectedTime == null) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: const Text(
                        'Please select party date & time',
                        style: TextStyle(fontWeight: FontWeight.w500),
                        textAlign: TextAlign.center,
                      ),
                      backgroundColor: AppColors.primaryRed,
                    ));
                  } else {
                    PartyBookingRepository.postPartyBooking(
                            partyType: PartyTypeRadioButton.currentValue ==
                                    PartyTypeRadioValue.birthdayParty
                                ? 'BIRTHDAY PARTY'
                                : PartyTypeRadioButton.currentValue ==
                                        PartyTypeRadioValue.classParty
                                    ? 'CLASS PARTY'
                                    : 'GET TOGETHER',
                            branch: BranchesRadioButtons.currentValue ==
                                    BranchRadioValue.badda
                                ? 'BADDA'
                                : BranchesRadioButtons.currentValue ==
                                        BranchRadioValue.mirpur
                                    ? 'MIRPUR'
                                    : BranchesRadioButtons.currentValue ==
                                            BranchRadioValue.uttara
                                        ? 'UTTARA'
                                        : 'WARI',
                            decoration: YesNoradioButton.currentValue ==
                                    YesNoRadioValue.no
                                ? 'N'
                                : 'Y',
                            pbStatus: 'PENDING',
                            customerId: '$customerId',
                            partyDateTime:
                                '${PartyDateTimePicker.userSelectedDate} ${PartyDateTimePicker.userSelectedTime}',
                            status: '')
                        .then((value) {
                      MimSmsRepository.sendSMS(
                              bicPhoneNumber:
                                  BranchesRadioButtons.currentValue ==
                                          BranchRadioValue.badda
                                      ? '016208559766'
                                      : BranchesRadioButtons.currentValue ==
                                              BranchRadioValue.mirpur
                                          ? '01790143309'
                                          : BranchesRadioButtons.currentValue ==
                                                  BranchRadioValue.wari
                                              ? '01620370322'
                                              : '01875927179',
                              apiKey: 'C20069265f4e550ccdf622.64468483',
                              type: 'text',
                              customerPhoneNumber: customerPhoneNumber,
                              message:
                                  // 'বাবুল্যান্ড অ্যাপে $customerPhoneNumber- নাম্বারটি পার্টির জন্য বুকিং দিয়েছে',
                                  ' A Customer has made booking for a party on our babuland app. contact $customerPhoneNumber',
                              label: 'notification',
                              senderPhoneNumber: 8809601000389)
                          .then((value) {
                        Navigator.pop(context);
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: const Text(
                            'Party Booking Confirmed',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                          backgroundColor: AppColors.primaryGreen,
                        ));
                      });
                    });
                  }
                },
                child: Center(
                  child: AppButton(
                    height: 50,
                    width: 275,
                    text: 'Confirm Booking',
                  ),
                ),
              ),
              const SizedBox(height: 25),
            ],
          ),
        ),
      ),
    );
  }
}
