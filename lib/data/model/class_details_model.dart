// To parse this JSON data, do
//
//     final classDetailsModel = classDetailsModelFromJson(jsonString);

import 'dart:convert';

ClassDetailsModel classDetailsModelFromJson(String str) =>
    ClassDetailsModel.fromJson(json.decode(str));

String classDetailsModelToJson(ClassDetailsModel data) =>
    json.encode(data.toJson());

class ClassDetailsModel {
  ClassDetailsModel({
    required this.items,
  });

  List<Item> items;

  factory ClassDetailsModel.fromJson(Map<String, dynamic> json) =>
      ClassDetailsModel(
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
      };
}

class Item {
  Item({
    required this.scheduleName,
    required this.day,
    required this.branch,
    required this.times,
  });

  String scheduleName;
  String day;
  String branch;
  String times;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        scheduleName: json["schedule_name"],
        day: json["day"],
        branch: json["branch"],
        times: json["times"],
      );

  Map<String, dynamic> toJson() => {
        "schedule_name": scheduleName,
        "day": day,
        "branch": branch,
        "times": times,
      };
}
