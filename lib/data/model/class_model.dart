// To parse this JSON data, do
//
//     final classModel = classModelFromJson(jsonString);

import 'dart:convert';

ClassModel classModelFromJson(String str) =>
    ClassModel.fromJson(json.decode(str));

String classModelToJson(ClassModel data) => json.encode(data.toJson());

class ClassModel {
  ClassModel({
    required this.items,
  });

  List<Item> items;

  factory ClassModel.fromJson(Map<String, dynamic> json) => ClassModel(
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
      };
}

class Item {
  Item({
    required this.scheduleId,
    required this.name,
    required this.category,
  });

  int scheduleId;
  String name;
  String category;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        scheduleId: json["schedule_id"],
        name: json["name"],
        category: json["category"],
      );

  Map<String, dynamic> toJson() => {
        "schedule_id": scheduleId,
        "name": name,
        "category": category,
      };
}
