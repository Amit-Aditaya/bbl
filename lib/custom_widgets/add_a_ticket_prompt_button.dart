import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_babuland_app/bloc/ticket_items/ticket_items_bloc.dart';
import 'package:flutter_babuland_app/data/repository/ticket_item_repository.dart';
import 'package:flutter_babuland_app/theme_helpers/colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class AddATicketPromptButton extends StatelessWidget {
  const AddATicketPromptButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showDialog(
            context: context,
            builder: (context) {
              return RepositoryProvider(
                create: (context) => TicketItemRepository(),
                child: AlertDialog(
                  title: Center(
                    child: Text(
                      'Select Tickets',
                      style: TextStyle(color: AppColors.primaryColor),
                    ),
                  ),
                  content: BlocProvider(
                    create: (context) => TicketItemsBloc(
                        RepositoryProvider.of<TicketItemRepository>(context))
                      ..add(LoadTicketItemsApiEvent()),
                    child: SizedBox(
                      height: 550,
                      width: 300,
                      child: BlocBuilder<TicketItemsBloc, TicketItemsState>(
                        builder: (context, state) {
                          if (state is TicketItemsLoadedState) {
                            return ListView.builder(
                                itemCount: state.ticketItemModel.items.length,
                                itemBuilder: (context, index) {
                                  return Container(
                                    margin: const EdgeInsets.symmetric(
                                        vertical: 10),
                                    child: ListTile(
                                      title: Text(
                                          '${state.ticketItemModel.items[index].productName}'),
                                      trailing: Container(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 10),
                                        width: 100,
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Icon(
                                                Icons.add_circle,
                                                size: 34,
                                                color: AppColors.primaryColor,
                                              ),
                                              const SizedBox(width: 5),
                                              Text('0'),
                                              const SizedBox(width: 5),
                                              Icon(
                                                Icons.remove_circle,
                                                size: 34,
                                                color: AppColors.primaryColor,
                                              )
                                            ]),
                                      ),
                                    ),
                                  );
                                });
                          } else {
                            return Center(
                                child: SpinKitCircle(
                              color: AppColors.primaryColor,
                            ));
                          }
                        },
                      ),
                    ),
                  ),
                ),
              );
            });
      },
      child: Text(
        '+ Add A Ticket',
        style: TextStyle(
          color: AppColors.primaryGreen,
          fontWeight: FontWeight.w500,
          letterSpacing: 1.5,
          fontSize: 17,
        ),
      ),
    );
  }
}
