import 'dart:convert';

WariTrafficModel wariTrafficModelFromJson(String str) =>
    WariTrafficModel.fromJson(json.decode(str));

String wariTrafficModelToJson(WariTrafficModel data) =>
    json.encode(data.toJson());

class WariTrafficModel {
  WariTrafficModel({
    required this.items,
  });

  List<Item> items;

  factory WariTrafficModel.fromJson(Map<String, dynamic> json) =>
      WariTrafficModel(
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
      };
}

class Item {
  Item({
    required this.qty,
  });

  int? qty;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        qty: json["qty"],
      );

  Map<String, dynamic> toJson() => {
        "qty": qty,
      };
}
