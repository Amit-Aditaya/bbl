import 'dart:convert';

PastEventModel pastEventModelFromJson(String str) =>
    PastEventModel.fromJson(json.decode(str));

String pastEventModelToJson(PastEventModel data) => json.encode(data.toJson());

class PastEventModel {
  PastEventModel({
    required this.items,
  });

  List<Item> items;

  factory PastEventModel.fromJson(Map<String, dynamic> json) => PastEventModel(
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
  ImageMime? imageMime;
  String appeventDate;
  String appeventDetails;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        appeventId: json["appevent_id"],
        appeventName: json["appevent_name"],
        imageFileName: json["image_file_name"],
        imageMime: imageMimeValues.map[json["image_mime"]],
        appeventDate: json["appevent_date"],
        appeventDetails: json["appevent_details"],
      );

  Map<String, dynamic> toJson() => {
        "appevent_id": appeventId,
        "appevent_name": appeventName,
        "image_file_name": imageFileName,
        "image_mime": imageMimeValues.reverse[imageMime],
        "appevent_date": appeventDate,
        "appevent_details": appeventDetails,
      };
}

enum ImageMime { IMAGE_JPEG, APPLICATION_OCTET_STREAM, IMAGE_PNG }

final imageMimeValues = EnumValues({
  "application/octet-stream": ImageMime.APPLICATION_OCTET_STREAM,
  "image/jpeg": ImageMime.IMAGE_JPEG,
  "image/png": ImageMime.IMAGE_PNG
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
