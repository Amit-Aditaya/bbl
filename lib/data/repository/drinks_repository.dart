import 'package:flutter_babuland_app/constants/links/app_link.dart';
import 'package:flutter_babuland_app/data/model/food_model.dart';
import 'package:http/http.dart';

class DrinksRepository {
  Future<FoodModel> getDrinks() async {
    final response = await get(
        Uri.parse('${AppLink.apiLink}apiv2/apiv3/food_list'),
        headers: {"FOOD_CATOGORY": "Drinks"});
    if (response.statusCode == 200) {
      final drinksList = foodModelFromJson(response.body);
      return drinksList;
    } else {
      throw Exception('FAST FOOD REPOSITORY ERROR');
    }
  }
}
