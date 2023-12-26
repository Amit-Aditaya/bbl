import 'dart:convert';

SlotBookingEventModel slotBookingEventModelFromJson(String str) =>
    SlotBookingEventModel.fromJson(json.decode(str));

String slotBookingEventModelToJson(SlotBookingEventModel data) =>
    json.encode(data.toJson());

class SlotBookingEventModel {
  SlotBookingEventModel({
    required this.items,
  });

  List<Item> items;

  factory SlotBookingEventModel.fromJson(Map<String, dynamic> json) =>
      SlotBookingEventModel(
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
      };
}

class Item {
  Item({
    required this.sbeId,
    required this.sbeDate,
    required this.sbeTitle,
    required this.visibilityStartDate,
    required this.visibilityEndDate,
    required this.sbeDetails,
    required this.visibility,
    required this.duration,
  });

  int sbeId;
  String sbeDate;
  String sbeTitle;
  String visibilityStartDate;
  String visibilityEndDate;
  String sbeDetails;
  String visibility;
  int duration;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        sbeId: json["sbe_id"],
        sbeDate: json["sbe_date"],
        sbeTitle: json["sbe_title"],
        visibilityStartDate: json["visibility_start_date"],
        visibilityEndDate: json["visibility_end_date"],
        sbeDetails: json["sbe_details"],
        visibility: json["visibility"],
        duration: json["duration"],
      );

  Map<String, dynamic> toJson() => {
        "sbe_id": sbeId,
        "sbe_date": sbeDate,
        "sbe_title": sbeTitle,
        "visibility_start_date": visibilityStartDate,
        "visibility_end_date": visibilityEndDate,
        "sbe_details": sbeDetails,
        "visibility": visibility,
        "duration": duration,
      };
}
