import 'package:flutter_babuland_app/constants/links/app_link.dart';
import 'package:flutter_babuland_app/data/model/food_model.dart';
import 'package:http/http.dart';

class FastFoodRepository {
  Future<FoodModel> getFastFood() async {
    final response = await get(
        Uri.parse('${AppLink.apiLink}apiv2/apiv3/food_list'),
        headers: {"FOOD_CATOGORY": "Fast Food"});
    if (response.statusCode == 200) {
      final fastFoodList = foodModelFromJson(response.body);
      return fastFoodList;
    } else {
      throw Exception('FAST FOOD REPOSITORY ERROR');
    }
  }
}
