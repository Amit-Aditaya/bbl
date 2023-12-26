import 'dart:convert';

BranchCapacityModel branchCapacityFromJson(String str) =>
    BranchCapacityModel.fromJson(json.decode(str));

String branchCapacityToJson(BranchCapacityModel data) =>
    json.encode(data.toJson());

class BranchCapacityModel {
  BranchCapacityModel({
    required this.items,
  });

  List<Item> items;

  factory BranchCapacityModel.fromJson(Map<String, dynamic> json) =>
      BranchCapacityModel(
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
      };
}

class Item {
  Item({
    required this.trafficId,
    required this.branch,
    required this.branchCapacity,
    required this.addedBy,
    required this.addedDate,
  });

  int trafficId;
  String branch;
  int branchCapacity;
  String addedBy;
  DateTime addedDate;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        trafficId: json["traffic_id"],
        branch: json["branch"],
        branchCapacity: json["branch_capacity"],
        addedBy: json["added_by"],
        addedDate: DateTime.parse(json["added_date"]),
      );

  Map<String, dynamic> toJson() => {
        "traffic_id": trafficId,
        "branch": branch,
        "branch_capacity": branchCapacity,
        "added_by": addedBy,
        "added_date": addedDate.toIso8601String(),
      };
}
