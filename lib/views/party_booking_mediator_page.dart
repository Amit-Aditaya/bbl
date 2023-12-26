import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_babuland_app/bloc/customer/customer_bloc.dart';
import 'package:flutter_babuland_app/custom_widgets/app_button.dart';
import 'package:flutter_babuland_app/custom_widgets/custom_app_bar.dart';
import 'package:flutter_babuland_app/data/repository/customer_repository.dart';
import 'package:flutter_babuland_app/theme_helpers/colors.dart';
import 'package:flutter_babuland_app/views/party_booking_history_page.dart';
import 'package:flutter_babuland_app/views/party_booking_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class PartyBookingMediatorPage extends StatelessWidget {
  PartyBookingMediatorPage({Key? key}) : super(key: key);

  late int customerId;
  late String customerPhoneNumber;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          CustomerBloc(RepositoryProvider.of<CustomerRepository>(context))
            ..add(LoadCustomerApiEvent()),
      child: Scaffold(
        appBar: CustomAppBar(
          backgroundColor: Colors.white,
          title: 'Party Bookings',
        ),
        backgroundColor: Colors.white,
        body: BlocBuilder<CustomerBloc, CustomerState>(
          builder: (context, state) {
            if (state is CustomerLoadedState) {
              customerId = state.customerModel.items[0].id;
              customerPhoneNumber = state.customerModel.items[0].mobileNumber;

              return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                        child: InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, 'partyBookingPage',
                                  arguments: PartyBookingPage(
                                    customerId: customerId,
                                    customerPhoneNumber: customerPhoneNumber,
                                  ));
                            },
                            child: AppButton(
                                height: 60,
                                width: 270,
                                text: 'Make A Booking'))),
                    const SizedBox(height: 35),
                    Center(
                        child: InkWell(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, 'partyBookingHistoryPage',
                                  arguments: PartyBookingHistorypage(
                                      customerId: customerId));
                            },
                            child: AppButton(
                                height: 60, width: 270, text: 'My Bookings'))),
                  ]);
            } else {
              return SpinKitWave(
                color: AppColors.primaryColor,
                size: 30,
              );
            }
          },
        ),
      ),
    );
  }
}
