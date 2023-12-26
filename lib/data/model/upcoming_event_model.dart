import 'dart:convert';

UpcomingEventModel upcomingEventModelFromJson(String str) =>
    UpcomingEventModel.fromJson(json.decode(str));

String upcomingEventModelToJson(UpcomingEventModel data) =>
    json.encode(data.toJson());

class UpcomingEventModel {
  UpcomingEventModel({
    required this.items,
  });

  List<Item> items;

  factory UpcomingEventModel.fromJson(Map<String, dynamic> json) =>
      UpcomingEventModel(
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
      };
}

class Item {
  Item({
    required this.appeventId,
    required this.appeventName,
    required this.imageFileName,
    required this.imageMime,
    required this.appeventDate,
    required this.appeventDetails,
  });

  int appeventId;
  String appeventName;
  String imageFileName;
  String imageMime;
  String appeventDate;
  String appeventDetails;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        appeventId: json["appevent_id"],
        appeventName: json["appevent_name"],
        imageFileName: json["image_file_name"],
        imageMime: json["image_mime"],
        appeventDate: json["appevent_date"],
        appeventDetails: json["appevent_details"],
      );

  Map<String, dynamic> toJson() => {
        "appevent_id": appeventId,
        "appevent_name": appeventName,
        "image_file_name": imageFileName,
        "image_mime": imageMime,
        "appevent_date": appeventDate,
        "appevent_details": appeventDetails,
      };
}
