import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_babuland_app/bloc/customer/customer_bloc.dart';
import 'package:flutter_babuland_app/custom_widgets/branches_radio_button.dart';
import 'package:flutter_babuland_app/data/repository/customer_repository.dart';
import 'package:flutter_babuland_app/data/repository/review_repository.dart';
import 'package:flutter_babuland_app/theme_helpers/colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class RatingPrompt {
  static Future<dynamic> ratingPromptShowDialogue(BuildContext context) {
    int? childCareRating;
    int? serviceRating;
    int? hygineRating;
    int? foodRating;
    int? washroomRating;
    TextEditingController commentEditingController = TextEditingController();
    return showDialog(
        context: context,
        builder: (context) {
          return RepositoryProvider(
            create: (context) => CustomerRepository(),
            child: Center(
              child: SingleChildScrollView(
                child: FittedBox(
                  child: BlocProvider(
                    create: (context) => CustomerBloc(
                        RepositoryProvider.of<CustomerRepository>(context))
                      ..add(LoadCustomerApiEvent()),
                    child: AlertDialog(
                      title: Center(
                        child: Text(
                          'How was your visit to Babuland?',
                          style: TextStyle(
                            color: AppColors.primaryColor,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text(
                            'Branch visited',
                            style: TextStyle(fontSize: 20),
                          ),
                          const BranchesRadioButtons(
                            initialBranch: BranchRadioValue.mirpur,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Child Care',
                                style: TextStyle(fontSize: 18),
                              ),
                              RatingBar.builder(
                                initialRating: 0,
                                minRating: 1,
                                direction: Axis.horizontal,
                                allowHalfRating: false,
                                itemSize: 25,
                                itemCount: 5,
                                itemBuilder: (context, _) => const Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                onRatingUpdate: (rating) {
                                  childCareRating = rating.toInt();
                                },
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Service',
                                style: TextStyle(fontSize: 18),
                              ),
                              RatingBar.builder(
                                initialRating: 0,
                                minRating: 1,
                                direction: Axis.horizontal,
                                allowHalfRating: false,
                                itemSize: 25,
                                itemCount: 5,
                                itemBuilder: (context, _) => const Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                onRatingUpdate: (rating) {
                                  serviceRating = rating.toInt();
                                },
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Hygiene',
                                style: TextStyle(fontSize: 18),
                              ),
                              RatingBar.builder(
                                initialRating: 0,
                                minRating: 1,
                                direction: Axis.horizontal,
                                allowHalfRating: false,
                                itemSize: 25,
                                itemCount: 5,
                                itemBuilder: (context, _) => const Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                onRatingUpdate: (rating) {
                                  hygineRating = rating.toInt();
                                },
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Food',
                                style: TextStyle(fontSize: 18),
                              ),
                              RatingBar.builder(
                                initialRating: 0,
                                minRating: 1,
                                direction: Axis.horizontal,
                                allowHalfRating: false,
                                itemSize: 25,
                                itemCount: 5,
                                itemBuilder: (context, _) => const Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                onRatingUpdate: (rating) {
                                  foodRating = rating.toInt();
                                },
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Washroom',
                                style: TextStyle(fontSize: 18),
                              ),
                              RatingBar.builder(
                                initialRating: 0,
                                minRating: 1,
                                direction: Axis.horizontal,
                                allowHalfRating: false,
                                itemSize: 25,
                                itemCount: 5,
                                itemBuilder: (context, _) => const Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                onRatingUpdate: (rating) {
                                  washroomRating = rating.toInt();
                                },
                              ),
                            ],
                          ),
                          const SizedBox(height: 25),
                          ConstrainedBox(
                            constraints: BoxConstraints(
                                maxHeight: MediaQuery.of(context).size.height,
                                maxWidth: MediaQuery.of(context).size.width),
                            child: Container(
                              height: 75,
                              width: double.infinity,
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                    width: 2, color: AppColors.primaryColor),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: TextField(
                                style: const TextStyle(fontSize: 15),
                                maxLines: 6,
                                controller: commentEditingController,
                                decoration: const InputDecoration(
                                    hintText: 'Say Something!',
                                    border: InputBorder.none),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          const SizedBox(height: 25),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Container(
                                  height: 40,
                                  width: 100,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: AppColors.primaryColor,
                                  ),
                                  child: const Center(
                                    child: Text(
                                      'cancel',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              BlocBuilder<CustomerBloc, CustomerState>(
                                builder: (context, state) {
                                  if (state is CustomerLoadedState) {
                                    return InkWell(
                                      onTap: () {
                                        if (serviceRating == null ||
                                            hygineRating == null ||
                                            childCareRating == null ||
                                            washroomRating == null ||
                                            foodRating == null) {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(const SnackBar(
                                                  backgroundColor: Colors.red,
                                                  content: Text(
                                                      'Please provide all the ratings')));
                                        } else {
                                          ReviewRepositoy.postReview(
                                                  mobileNumber: state
                                                      .customerModel
                                                      .items[0]
                                                      .mobileNumber,
                                                  branchName: BranchesRadioButtons
                                                              .currentValue ==
                                                          BranchRadioValue.badda
                                                      ? 'BADDA-BRANCH'
                                                      : BranchesRadioButtons
                                                                  .currentValue ==
                                                              BranchRadioValue
                                                                  .mirpur
                                                          ? 'MIRPUR-BRANCH'
                                                          : BranchesRadioButtons
                                                                      .currentValue ==
                                                                  BranchRadioValue
                                                                      .uttara
                                                              ? 'UTTARA-BRANCH'
                                                              : BranchesRadioButtons
                                                                          .currentValue ==
                                                                      BranchRadioValue
                                                                          .wari
                                                                  ? 'WARI-BRANCH'
                                                                  : '??',
                                                  serviceRating: serviceRating!,
                                                  hygineRating: hygineRating!,
                                                  childCareRating:
                                                      childCareRating!,
                                                  foodRating: foodRating!,
                                                  washroomRating:
                                                      washroomRating!,
                                                  comments: commentEditingController
                                                          .text.isEmpty
                                                      ? ''
                                                      : commentEditingController
                                                          .text)
                                              .then((value) {
                                            Navigator.pop(context);
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(SnackBar(
                                                    backgroundColor:
                                                        AppColors.primaryGreen,
                                                    content: const Text(
                                                      'Thank You For Your Review',
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w500),
                                                      textAlign:
                                                          TextAlign.center,
                                                    )));
                                          });
                                        }
                                      },
                                      child: Container(
                                        height: 40,
                                        width: 100,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: AppColors.primaryColor,
                                        ),
                                        child: const Center(
                                          child: Text(
                                            'Submit',
                                            style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  } else {
                                    return SpinKitWave(
                                      color: AppColors.primaryColor,
                                    );
                                  }
                                },
                              ),
                            ],
                          ),
                          const SizedBox(height: 25),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }
}
