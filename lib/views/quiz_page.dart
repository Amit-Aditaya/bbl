import 'package:flutter/material.dart';
import 'package:flutter_babuland_app/bloc/customer/customer_bloc.dart';
import 'package:flutter_babuland_app/custom_widgets/app_button.dart';
import 'package:flutter_babuland_app/custom_widgets/custom_app_bar.dart';
import 'package:flutter_babuland_app/data/repository/customer_repository.dart';
import 'package:flutter_babuland_app/views/live_quiz_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class QuizPage extends StatelessWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          CustomerBloc(RepositoryProvider.of<CustomerRepository>(context))
            ..add(LoadCustomerApiEvent()),
      child: Scaffold(
        appBar: CustomAppBar(
          title: 'Quiz',
          backgroundColor: Colors.white,
        ),
        backgroundColor: Colors.white,
        body: BlocBuilder<CustomerBloc, CustomerState>(
          builder: (context, state) {
            if (state is CustomerLoadedState) {
              return SizedBox(
                height: 700,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //const SizedBox(height: 30),
                    Container(
                      height: 65,
                      width: 65,
                      margin: const EdgeInsets.all(2),
                      child: IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset(
                          'assets/images/03-Award.svg',
                          height: 55,
                          width: 55,
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),

                    InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, 'liveQuizPage',
                              arguments: LiveQuizPage(
                                  customerPhoneNumber:
                                      state.customerModel.items[0].mobileNumber,
                                  customerName:
                                      state.customerModel.items[0].fullname ??
                                          ''));
                        },
                        child: AppButton(
                            height: 60, width: 300, text: 'Enter Live Quiz'))
                  ],
                ),
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
