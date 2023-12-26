// To parse this JSON data, do
//
//     final bookedSlotsModel = bookedSlotsModelFromJson(jsonString);

import 'dart:convert';

BookedSlotsModel bookedSlotsModelFromJson(String str) =>
    BookedSlotsModel.fromJson(json.decode(str));

String bookedSlotsModelToJson(BookedSlotsModel data) =>
    json.encode(data.toJson());

class BookedSlotsModel {
  BookedSlotsModel({
    required this.items,
  });

  List<Item> items;

  factory BookedSlotsModel.fromJson(Map<String, dynamic> json) =>
      BookedSlotsModel(
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
      };
}

class Item {
  Item({
    required this.bookingId,
    required this.bookingDate,
    required this.bookingSlotId,
    required this.customerName,
    required this.bookingBrunch,
    required this.sbeId,
    required this.eventTitale,
    required this.sbeDate,
    required this.bookingTime,
  });

  int bookingId;
  String bookingDate;
  int bookingSlotId;
  String customerName;
  String bookingBrunch;
  int sbeId;
  String eventTitale;
  String sbeDate;
  String bookingTime;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        bookingId: json["booking_id"],
        bookingDate: json["booking_date"],
        bookingSlotId: json["booking_slot_id"],
        customerName: json["customer_name"],
        bookingBrunch: json["booking_brunch"],
        sbeId: json["sbe_id"],
        eventTitale: json["event_titale"],
        sbeDate: json["sbe_date"],
        bookingTime: json["booking_time"],
      );

  Map<String, dynamic> toJson() => {
        "booking_id": bookingId,
        "booking_date": bookingDate,
        "booking_slot_id": bookingSlotId,
        "customer_name": customerName,
        "booking_brunch": bookingBrunch,
        "sbe_id": sbeId,
        "event_titale": eventTitale,
        "sbe_date": sbeDate,
        "booking_time": bookingTime,
      };
}
