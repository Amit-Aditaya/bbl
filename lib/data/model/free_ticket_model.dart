// To parse this JSON data, do
//
//     final freeTicketModel = freeTicketModelFromJson(jsonString);

import 'dart:convert';

FreeTicketModel freeTicketModelFromJson(String str) =>
    FreeTicketModel.fromJson(json.decode(str));

String freeTicketModelToJson(FreeTicketModel data) =>
    json.encode(data.toJson());

class FreeTicketModel {
  FreeTicketModel({
    required this.items,
    required this.first,
  });

  List<Item> items;
  First first;

  factory FreeTicketModel.fromJson(Map<String, dynamic> json) =>
      FreeTicketModel(
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
        first: First.fromJson(json["first"]),
      );

  Map<String, dynamic> toJson() => {
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
        "first": first.toJson(),
      };
}

class First {
  First({
    required this.ref,
  });

  String ref;

  factory First.fromJson(Map<String, dynamic> json) => First(
        ref: json["\u0024ref"],
      );

  Map<String, dynamic> toJson() => {
        "\u0024ref": ref,
      };
}

class Item {
  Item({
    required this.fstId,
    required this.phoneNumber,
    required this.branch,
    required this.customerId,
    required this.avil,
    required this.expairDate,
    required this.token,
    required this.productName,
    required this.addedDate,
  });

  int fstId;
  int phoneNumber;
  String branch;
  int customerId;
  String avil;
  String expairDate;
  String? token;
  String productName;
  String addedDate;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        fstId: json["fst_id"],
        phoneNumber: json["phone_number"],
        branch: json["branch"],
        customerId: json["customer_id"],
        avil: json["avil"],
        expairDate: json["expair_date"],
        token: json["token"] == null ? null : json["token"],
        productName: json["product_name"] == null ? '' : json["product_name"],
        addedDate: json["added_date"],
      );

  Map<String, dynamic> toJson() => {
        "fst_id": fstId,
        "phone_number": phoneNumber,
        "branch": branch,
        "customer_id": customerId,
        "avil": avil,
        "expair_date": expairDate,
        "token": token == null ? null : token,
        "product_name": productName,
        "added_date": addedDate,
      };
}
