import 'dart:convert';

MirpurTrafficModel mirpurTrafficModelFromJson(String str) =>
    MirpurTrafficModel.fromJson(json.decode(str));

String mirpurTrafficModelToJson(MirpurTrafficModel data) =>
    json.encode(data.toJson());

class MirpurTrafficModel {
  MirpurTrafficModel({
    required this.items,
  });

  List<Item> items;

  factory MirpurTrafficModel.fromJson(Map<String, dynamic> json) =>
      MirpurTrafficModel(
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
