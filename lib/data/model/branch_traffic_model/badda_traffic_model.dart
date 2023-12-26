import 'dart:convert';

BaddaTrafficModel baddaTrafficModelFromJson(String str) =>
    BaddaTrafficModel.fromJson(json.decode(str));

String baddaTrafficModelToJson(BaddaTrafficModel data) =>
    json.encode(data.toJson());

class BaddaTrafficModel {
  BaddaTrafficModel({
    required this.items,
  });

  List<Item> items;

  factory BaddaTrafficModel.fromJson(Map<String, dynamic> json) =>
      BaddaTrafficModel(
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
