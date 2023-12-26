import 'dart:convert';

SlotBookingBranchModel slotBookingBranchModelFromJson(String str) =>
    SlotBookingBranchModel.fromJson(json.decode(str));

String slotBookingBranchModelToJson(SlotBookingBranchModel data) =>
    json.encode(data.toJson());

class SlotBookingBranchModel {
  SlotBookingBranchModel({
    required this.items,
  });

  List<Item> items;

  factory SlotBookingBranchModel.fromJson(Map<String, dynamic> json) =>
      SlotBookingBranchModel(
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
      };
}

class Item {
  Item({
    required this.branch,
  });

  String branch;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        branch: json["branch"],
      );

  Map<String, dynamic> toJson() => {
        "branch": branch,
      };
}
