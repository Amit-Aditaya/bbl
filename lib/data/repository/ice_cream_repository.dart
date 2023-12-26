import 'package:flutter_babuland_app/constants/links/app_link.dart';
import 'package:flutter_babuland_app/data/model/food_model.dart';
import 'package:http/http.dart';

class IceCreamRepository {
  Future<FoodModel> getIceCream() async {
    final response = await get(
        Uri.parse('${AppLink.apiLink}apiv2/apiv3/food_list'),
        headers: {"FOOD_CATOGORY": "Ice cream"});
    if (response.statusCode == 200) {
      final iceCreamList = foodModelFromJson(response.body);
      return iceCreamList;
    } else {
      throw Exception('FAST FOOD REPOSITORY ERROR');
    }
  }
}
