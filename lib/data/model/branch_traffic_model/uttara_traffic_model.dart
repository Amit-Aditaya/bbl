import 'dart:convert';

UttaraTrafficModel uttaraTrafficModelFromJson(String str) =>
    UttaraTrafficModel.fromJson(json.decode(str));

String uttaraTrafficModelToJson(UttaraTrafficModel data) =>
    json.encode(data.toJson());

class UttaraTrafficModel {
  UttaraTrafficModel({
    required this.items,
  });

  List<Item> items;

  factory UttaraTrafficModel.fromJson(Map<String, dynamic> json) =>
      UttaraTrafficModel(
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
