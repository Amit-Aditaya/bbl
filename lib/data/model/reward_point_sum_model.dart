import 'dart:convert';

RewardPointsSumModel rewardPointsSumModelFromJson(String str) =>
    RewardPointsSumModel.fromJson(json.decode(str));

String rewardPointsSumModelToJson(RewardPointsSumModel data) =>
    json.encode(data.toJson());

class RewardPointsSumModel {
  RewardPointsSumModel({
    required this.items,
  });

  List<Item> items;

  factory RewardPointsSumModel.fromJson(Map<String, dynamic> json) =>
      RewardPointsSumModel(
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
      };
}

class Item {
  Item({
    required this.creditSum,
    required this.debitSum,
  });

  int creditSum;
  int debitSum;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        creditSum: json["credit_sum"],
        debitSum: json["debit_sum"],
      );

  Map<String, dynamic> toJson() => {
        "credit_sum": creditSum,
        "debit_sum": debitSum,
      };
}
