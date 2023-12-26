import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_babuland_app/bloc/party_booking_history/party_booking_history_bloc.dart';
import 'package:flutter_babuland_app/custom_widgets/party_history_card.dart';
import 'package:flutter_babuland_app/data/repository/party_booking_history_repository.dart';
import 'package:flutter_babuland_app/theme_helpers/colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class PartyBookingHistorypage extends StatelessWidget {
  final int customerId;

  const PartyBookingHistorypage({Key? key, required this.customerId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PartyBookingHistoryBloc(
          RepositoryProvider.of<PartyBookingRepository>(context), customerId)
        ..add(LoadPartyBookingHistoryApiEvent()),
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: AppColors.primaryColor),
          leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(Icons.arrow_back)),
          title: Text(
            'Booking History',
            style: TextStyle(color: AppColors.primaryColor),
          ),
          centerTitle: true,
          backgroundColor: Colors.grey.shade300,
          elevation: 0,
        ),
        backgroundColor: Colors.grey.shade300,
        body: SingleChildScrollView(child:
            BlocBuilder<PartyBookingHistoryBloc, PartyBookingHistoryState>(
          builder: (context, state) {
            if (state is PartyBookingHistoryLoadedState) {
              return state.partyBookingHistoryModel.items.isEmpty
                  ? Center(
                      child: Text(
                        'No Previous Bookings',
                        style: TextStyle(color: AppColors.textGrey2),
                      ),
                    )
                  : Column(
                      children: List.generate(
                          state.partyBookingHistoryModel.items.length,
                          (index) => PartyHistoryCard(
                                partyHistoryItem:
                                    state.partyBookingHistoryModel.items[index],
                              )));
            } else {
              return SpinKitWave(
                color: AppColors.primaryColor,
                size: 30,
              );
            }
          },
        )),
      ),
    );
  }
}
