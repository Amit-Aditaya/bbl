import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_babuland_app/bloc/classes/classes_bloc.dart';
import 'package:flutter_babuland_app/custom_widgets/class_card.dart';
import 'package:flutter_babuland_app/custom_widgets/custom_app_bar.dart';
import 'package:flutter_babuland_app/data/repository/class_repository.dart';
import 'package:flutter_babuland_app/theme_helpers/colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ClassSchedulePage extends StatelessWidget {
  const ClassSchedulePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ClassesBloc(RepositoryProvider.of<ClassRepository>(context))
            ..add(LoadClassesApiEvent()),
      child: Scaffold(
        appBar: CustomAppBar(
          backgroundColor: Colors.white,
          title: 'Class Schedule',
        ),
        backgroundColor: Colors.white,
        body: BlocBuilder<ClassesBloc, ClassesState>(
          builder: (context, state) {
            if (state is ClassesLoadedState) {
              return Container(
                color: Colors.transparent,
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                child: ListView.builder(
                    itemCount: state.classModel.items.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, 'schedulePage',
                              arguments: ClassCard(
                                className: state.classModel.items[index].name,
                                classId:
                                    state.classModel.items[index].scheduleId,
                              ));
                        },
                        child: ClassCard(
                            className: state.classModel.items[index].name,
                            classId: state.classModel.items[index].scheduleId),
                      );
                    }),
              );
            } else {
              return Center(
                child:
                    CupertinoActivityIndicator(color: AppColors.primaryColor),
              );
            }
          },
        ),
      ),
    );
  }
}
