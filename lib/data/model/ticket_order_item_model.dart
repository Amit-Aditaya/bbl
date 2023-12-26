import 'dart:convert';

TicketOrderItemModel ticketOrderItemModelFromJson(String str) =>
    TicketOrderItemModel.fromJson(json.decode(str));

String ticketOrderItemModelToJson(TicketOrderItemModel data) =>
    json.encode(data.toJson());

class TicketOrderItemModel {
  TicketOrderItemModel({
    required this.items,
  });

  List<Item> items;

  factory TicketOrderItemModel.fromJson(Map<String, dynamic> json) =>
      TicketOrderItemModel(
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
      };
}

class Item {
  Item({
    required this.pk,
    required this.iteminfoFk,
    required this.tslmsFk,
    required this.dsc,
    required this.tp,
    required this.mrp,
    required this.qty,
    required this.discount,
    required this.vat,
    required this.bunitFk,
    required this.isCombo,
    required this.appAvail,
    required this.msmasteridOffersid,
  });

  int pk;
  int iteminfoFk;
  int tslmsFk;
  String dsc;
  int tp;
  int mrp;
  int qty;
  int discount;
  double vat;
  int bunitFk;
  int isCombo;
  String? appAvail;
  String msmasteridOffersid;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        pk: json["pk"],
        iteminfoFk: json["iteminfo_fk"],
        tslmsFk: json["tslms_fk"],
        dsc: json["dsc"],
        tp: json["tp"],
        mrp: json["mrp"],
        qty: json["qty"],
        discount: json["discount"],
        vat: json["vat"].toDouble(),
        bunitFk: json["bunit_fk"],
        isCombo: json["is_combo"],
        appAvail: json["app_avail"],
        msmasteridOffersid: json["msmasterid_offersid"],
      );

  Map<String, dynamic> toJson() => {
        "pk": pk,
        "iteminfo_fk": iteminfoFk,
        "tslms_fk": tslmsFk,
        "dsc": dsc,
        "tp": tp,
        "mrp": mrp,
        "qty": qty,
        "discount": discount,
        "vat": vat,
        "bunit_fk": bunitFk,
        "is_combo": isCombo,
        "app_avail": appAvail,
        "msmasterid_offersid": msmasteridOffersid,
      };
}
