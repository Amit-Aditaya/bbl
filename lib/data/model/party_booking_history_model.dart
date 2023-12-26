import 'dart:convert';

PartyBookingHistoryModel partyBookingHistoryModelFromJson(String str) =>
    PartyBookingHistoryModel.fromJson(json.decode(str));

String partyBookingHistoryModelToJson(PartyBookingHistoryModel data) =>
    json.encode(data.toJson());

class PartyBookingHistoryModel {
  PartyBookingHistoryModel({
    required this.items,
  });

  List<Item> items;

  factory PartyBookingHistoryModel.fromJson(Map<String, dynamic> json) =>
      PartyBookingHistoryModel(
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
      };
}

class Item {
  Item({
    required this.partyType,
    required this.branch,
    required this.partyTime,
    required this.partyDate,
    required this.decoration,
    required this.pbStatus,
  });

  String partyType;
  String branch;
  String partyTime;
  String partyDate;
  String decoration;
  String pbStatus;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        partyType: json["party_type"],
        branch: json["branch"],
        partyTime: json["party_time"],
        partyDate: json["party_date"],
        decoration: json["decoration"],
        pbStatus: json["pb_status"],
      );

  Map<String, dynamic> toJson() => {
        "party_type": partyType,
        "branch": branch,
        "party_time": partyTime,
        "party_date": partyDate,
        "decoration": decoration,
        "pb_status": pbStatus,
      };
}
