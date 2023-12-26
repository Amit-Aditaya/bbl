import 'dart:convert';

MembershipModel membershipModelFromJson(String str) =>
    MembershipModel.fromJson(json.decode(str));

String membershipModelToJson(MembershipModel data) =>
    json.encode(data.toJson());

class MembershipModel {
  MembershipModel({
    required this.items,
  });

  List<Item> items;

  factory MembershipModel.fromJson(Map<String, dynamic> json) =>
      MembershipModel(
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
      };
}

class Item {
  Item({
    required this.id,
    required this.packageTitle,
    required this.packageName,
    required this.packagePrice,
    required this.regularPrice,
    required this.packageValue,
    required this.packageTime,
    required this.packageDescription,
    required this.packageAvail,
    required this.packageType,
  });

  int id;
  String? packageTitle;
  String packageName;
  int packagePrice;
  int regularPrice;
  String packageValue;
  int packageTime;
  String packageDescription;
  String packageAvail;
  String packageType;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        id: json["id"],
        packageTitle: json["package_title"] ?? 'null',
        packageName: json["package_name"],
        packagePrice: json["package_price"],
        regularPrice: json["regular_price"],
        packageValue: json["package_value"],
        packageTime: json["package_time"],
        packageDescription: json["package_description"],
        packageAvail: json["package_avail"],
        packageType: json["package_type"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        'package_title': packageTitle,
        "package_name": packageName,
        "package_price": packagePrice,
        "regular_price": regularPrice,
        "package_value": packageValue,
        "package_time": packageTime,
        "package_description": packageDescription,
        "package_avail": packageAvail,
        "package_type": packageType,
      };
}
