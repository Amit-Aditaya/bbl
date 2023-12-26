import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_babuland_app/bloc/class_details/class_details_bloc.dart';
import 'package:flutter_babuland_app/custom_widgets/class_card.dart';
import 'package:flutter_babuland_app/custom_widgets/class_details_card.dart';
import 'package:flutter_babuland_app/custom_widgets/custom_app_bar.dart';
import 'package:flutter_babuland_app/data/repository/class_details_repository.dart';
import 'package:flutter_babuland_app/theme_helpers/colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SchedulePage extends StatelessWidget {
  //const SchedulePage({Key? key}) : super(key: key);
  final ClassCard card;
  const SchedulePage({required this.card});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ClassDetailsBloc(
          RepositoryProvider.of<ClassDetailsRepository>(context))
        ..add(LoadClassDetailsApiEvent()),
      child: Scaffold(
        appBar: CustomAppBar(
          backgroundColor: Colors.white,
          title: 'Schedule',
        ),
        backgroundColor: Colors.white,
        body: BlocBuilder<ClassDetailsBloc, ClassDetailsState>(
          builder: (context, state) {
            if (state is ClassDetailsLoadedState) {
              return SingleChildScrollView(
                child: Container(
                  color: Colors.white,
                  child: Column(children: [
                    Container(
                      padding: EdgeInsets.all(15),
                      child: Center(
                        child: card,
                      ),
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 7.5),
                      height: MediaQuery.of(context).size.height,
                      width: double.infinity,
                      child: ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: state.classDetailsModel.items.length,
                          itemBuilder: ((context, index) {
                            return ClassDetailsCard(
                              branchName:
                                  state.classDetailsModel.items[index].branch,
                              time: state.classDetailsModel.items[index].times,
                              day: state.classDetailsModel.items[index].day,
                            );
                          })),
                    )
                  ]),
                ),
              );
            } else {
              return Center(
                child: CupertinoActivityIndicator(
                  color: AppColors.primaryColor,
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
