// To parse this JSON data, do
//
//     final slotBookingTimeModel = slotBookingTimeModelFromJson(jsonString);

import 'dart:convert';

SlotBookingTimeModel slotBookingTimeModelFromJson(String str) =>
    SlotBookingTimeModel.fromJson(json.decode(str));

String slotBookingTimeModelToJson(SlotBookingTimeModel data) =>
    json.encode(data.toJson());

class SlotBookingTimeModel {
  SlotBookingTimeModel({
    required this.items,
  });

  List<Item> items;

  factory SlotBookingTimeModel.fromJson(Map<String, dynamic> json) =>
      SlotBookingTimeModel(
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
      };
}

class Item {
  Item({
    required this.timeSlotId,
    required this.timeSlotName,
    required this.timeSlotCapacity,
    required this.numberOfSlotUsed,
    required this.remainSlot,
  });

  int timeSlotId;
  String timeSlotName;
  int timeSlotCapacity;
  int numberOfSlotUsed;
  int remainSlot;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        timeSlotId: json["time_slot_id"],
        timeSlotName: json["time_slot_name"],
        timeSlotCapacity: json["time_slot_capacity"],
        numberOfSlotUsed: json["number_of_slot_used"],
        remainSlot: json["remain_slot"],
      );

  Map<String, dynamic> toJson() => {
        "time_slot_id": timeSlotId,
        "time_slot_name": timeSlotName,
        "time_slot_capacity": timeSlotCapacity,
        "number_of_slot_used": numberOfSlotUsed,
        "remain_slot": remainSlot,
      };
}
