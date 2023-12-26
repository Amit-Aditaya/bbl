import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_babuland_app/bloc/fast_food/fast_food_bloc.dart';
import 'package:flutter_babuland_app/custom_widgets/custom_app_bar.dart';
import 'package:flutter_babuland_app/data/repository/fast_food_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class FastFoodPage extends StatelessWidget {
  const FastFoodPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          FastFoodBloc(RepositoryProvider.of<FastFoodRepository>(context))
            ..add(LoadFastFoodApiEvent()),
      child: Scaffold(
        appBar: CustomAppBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          title: 'Fast Food',
        ),
        body: BlocBuilder<FastFoodBloc, FastFoodState>(
          builder: (context, state) {
            if (state is FastFoodLoadedState) {
              return Container(
                color: Theme.of(context).primaryColor, //theming
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
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ),
                                child: Image(
                                  fit: BoxFit.fill,
                                  image: NetworkImage(
                                    'http://apps.babuland.org/bblapi/apiv2/apiv1/food_img/${state.foodModel.items[index].appFoodId}',
                                  ),
                                ),
                              ),
                              Container(
                                width: 125,
                                height: 125,
                                color: Theme.of(context)
                                    .colorScheme
                                    .background, //theming
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                      height: 25,
                                      width: 70,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(25),
                                        color: Theme.of(context).cardColor,
                                      ),
                                      child: Center(
                                        child: Text(
                                          '${state.foodModel.items[index].foodPrice}৳',
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 3),
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
                                      style: Theme.of(context)
                                          .textTheme
                                          .displayMedium, //theming
                                    ),
                                    Text(
                                      'Available At',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium, //theming
                                    ),
                                    Text(
                                      state.foodModel.items[index]
                                          .availableBranch,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall, //theming
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              );
            } else {
              return Center(
                child: CupertinoActivityIndicator(
                  color: Theme.of(context).primaryColor,
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
