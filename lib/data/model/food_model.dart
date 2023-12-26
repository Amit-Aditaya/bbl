// To parse this JSON data, do
//
//     final foodModel = foodModelFromJson(jsonString);

import 'dart:convert';

FoodModel foodModelFromJson(String str) => FoodModel.fromJson(json.decode(str));

String foodModelToJson(FoodModel data) => json.encode(data.toJson());

class FoodModel {
  FoodModel({
    required this.items,
  });

  List<Item> items;

  factory FoodModel.fromJson(Map<String, dynamic> json) => FoodModel(
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
      };
}

class Item {
  Item({
    required this.appFoodId,
    required this.foodName,
    required this.foodPrice,
    required this.foodCatogory,
    required this.imageName,
    required this.mimeType,
    required this.availableBranch,
  });

  int appFoodId;
  String foodName;
  int foodPrice;
  String foodCatogory;
  String imageName;
  String mimeType;
  String availableBranch;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        appFoodId: json["app_food_id"],
        foodName: json["food_name"],
        foodPrice: json["food_price"],
        foodCatogory: json["food_catogory"],
        imageName: json["image_name"],
        mimeType: json["mime_type"],
        availableBranch: json["available_branch"],
      );

  Map<String, dynamic> toJson() => {
        "app_food_id": appFoodId,
        "food_name": foodName,
        "food_price": foodPrice,
        "food_catogory": foodCatogory,
        "image_name": imageName,
        "mime_type": mimeType,
        "available_branch": availableBranch,
      };
}
