import 'dart:convert';

RewardPointsHistoryModel rewardPointsHistoryModelFromJson(String str) =>
    RewardPointsHistoryModel.fromJson(json.decode(str));

String rewardPointsHistoryModelToJson(RewardPointsHistoryModel data) =>
    json.encode(data.toJson());

class RewardPointsHistoryModel {
  RewardPointsHistoryModel({
    required this.items,
  });

  List<Item> items;

  factory RewardPointsHistoryModel.fromJson(Map<String, dynamic> json) =>
      RewardPointsHistoryModel(
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
      };
}

class Item {
  Item({
    required this.id,
    required this.phoneNumber,
    required this.pkgName,
    required this.rpQty,
    required this.trxType,
    required this.addedOn,
  });

  int id;
  String phoneNumber;
  String pkgName;
  int rpQty;
  String trxType;
  String addedOn;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        id: json["id"],
        phoneNumber: json["phone_number"],
        pkgName: json["pkg_name"],
        rpQty: json["rp_qty"],
        trxType: json["trx_type"],
        addedOn: json["added_on"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "phone_number": phoneNumber,
        "pkg_name": pkgName,
        "rp_qty": rpQty,
        "trx_type": trxType,
        "added_on": addedOn,
      };
}
