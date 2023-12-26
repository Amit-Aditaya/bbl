import 'package:flutter/material.dart';
import 'package:flutter_babuland_app/bloc/free_ticekt/free_ticket_bloc.dart';
import 'package:flutter_babuland_app/custom_widgets/custom_app_bar.dart';
import 'package:flutter_babuland_app/custom_widgets/ticket_container.dart';
import 'package:flutter_babuland_app/custom_widgets/ticket_item_container.dart';
import 'package:flutter_babuland_app/data/repository/free_ticket_repository.dart';
import 'package:flutter_babuland_app/theme_helpers/colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class FreeTicketsPage extends StatelessWidget {
  //const FreeTicketsPage({Key? key}) : super(key: key);
  static Set<TicketItemContainer> selectedFreeTicketItemList = {};

  static String? selectedTicketExpireDate;

  const FreeTicketsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          FreeTicketBloc(RepositoryProvider.of<FreeTicketRepository>(context))
            ..add(LoadFreeTicketApiEvent()),
      child: Scaffold(
        appBar: CustomAppBar(
          backgroundColor: Colors.white, // reuse of components
          title: 'Free Tickets',
        ),
        backgroundColor: Colors.white,
        body: BlocBuilder<FreeTicketBloc, FreeTicketState>(
          builder: (context, state) {
            if (state is FreeTicketLoadedState) {
              return ListView.builder(
                  itemCount: state.freeTicketModel.items.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      child: TicketContainer(
                        freeTicketItem: state.freeTicketModel.items[index],
                      ),
                    );
                  });
            } else if ((state is FreeTicketLoadingState)) {
              return Center(
                child: SpinKitFadingGrid(
                  size: 35,
                  color: AppColors.primaryColor,
                ),
              );
            } else {
              return const Center(
                child: Text('An error has occured'),
              );
            }
          },
        ),
      ),
    );
  }
}
