import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_babuland_app/bloc/dessert/dessert_bloc.dart';
import 'package:flutter_babuland_app/custom_widgets/custom_app_bar.dart';
import 'package:flutter_babuland_app/data/repository/dessert_repository.dart';
import 'package:flutter_babuland_app/theme_helpers/colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class DesertsPage extends StatelessWidget {
  const DesertsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          DessertBloc(RepositoryProvider.of<DessertRepository>(context))
            ..add(LoadDessertApiEvent()),
      child: Scaffold(
        appBar: CustomAppBar(
          backgroundColor: Colors.white,
          title: 'Desserts',
        ),
        body: BlocBuilder<DessertBloc, DessertState>(
          builder: (context, state) {
            if (state is DessertLoadedState) {
              return Container(
                color: Colors.white,
                padding: const EdgeInsets.all(5),
                child: ListView.builder(
                    itemCount: state.foodModel.items.length,
                    itemBuilder: (context, index) {
                      return FittedBox(
                        child: Card(
                          elevation: 6,
                          margin: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 7),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 8, horizontal: 4),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  margin: const EdgeInsets.all(5),
                                  height: 125,
                                  width: 150,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      width: 2,
                                      color: AppColors.primaryColor,
                                    ),
                                  ),
                                  child: Image(
                                    fit: BoxFit.fill,
                                    image: NetworkImage(
                                        'http://apps.babuland.org/bblapi/apiv2/apiv1/food_img/${state.foodModel.items[index].appFoodId}'),
                                  ),
                                ),
                                Container(
                                  width: 135,
                                  height: 130,
                                  color: Colors.white,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Container(
                                        height: 25,
                                        width: 70,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(25),
                                          color: AppColors.primaryGreen,
                                        ),
                                        child: Center(
                                          child: Text(
                                            '${state.foodModel.items[index].foodPrice}৳',
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 14,
                                              letterSpacing: 1.1,
                                            ),
                                          ),
                                        ),
                                      ),
                                      RatingBar.builder(
                                        initialRating: 0,
                                        minRating: 1,
                                        direction: Axis.horizontal,
                                        allowHalfRating: false,
                                        itemSize: 22,
                                        itemCount: 5,
                                        itemBuilder: (context, _) => const Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                        ),
                                        onRatingUpdate: (rating) {
                                          print(rating);
                                        },
                                      ),
                                      Text(
                                        state.foodModel.items[index].foodName,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: AppColors.primaryColor,
                                          fontSize: 13,
                                        ),
                                      ),
                                      const Text(
                                        'Available At',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 9,
                                          letterSpacing: 1.1,
                                        ),
                                      ),
                                      Text(
                                        state.foodModel.items[index]
                                            .availableBranch,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: AppColors.textGrey2,
                                          fontSize: 10,
                                          letterSpacing: 1.1,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
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
