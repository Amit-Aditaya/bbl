import 'dart:convert';

OfferModel offerModelFromJson(String str) =>
    OfferModel.fromJson(json.decode(str));

String offerModelToJson(OfferModel data) => json.encode(data.toJson());

class OfferModel {
  OfferModel({
    required this.items,
  });

  List<Item> items;

  factory OfferModel.fromJson(Map<String, dynamic> json) => OfferModel(
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
      };
}

class Item {
  Item({
    required this.pk,
    required this.isCombo,
    required this.priceSetId,
    required this.itemId,
    required this.productName,
    required this.itemDsc,
    required this.costPrice,
    required this.mrp,
    required this.mrpExcludingVat,
    required this.vatAmount,
    required this.vatPercent,
    required this.discount,
    required this.isActive,
    required this.isDiscountable,
    required this.bunit,
    required this.validityStart,
    required this.validityEndUnix,
    required this.inson,
    required this.insby,
    required this.imgUrl,
  });

  int pk;
  int isCombo;
  int priceSetId;
  int itemId;
  String productName;
  String itemDsc;
  int costPrice;
  int mrp;
  double mrpExcludingVat;
  double vatAmount;
  double vatPercent;
  double discount;
  int isActive;
  int isDiscountable;
  int bunit;
  String validityStart;
  String validityEndUnix;
  String inson;
  String insby;
  String imgUrl;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        pk: json["pk"],
        isCombo: json["is_combo"],
        priceSetId: json["price_set_id"],
        itemId: json["item_id"],
        productName: json["product_name"],
        itemDsc: json["item_dsc"],
        costPrice: json["cost_price"],
        mrp: json["mrp"],
        mrpExcludingVat: json["mrp_excluding_vat"].toDouble(),
        vatAmount: json["vat_amount"].toDouble(),
        vatPercent: json["vat_percent"].toDouble(),
        discount: json["discount"].toDouble(),
        isActive: json["is_active"],
        isDiscountable: json["is_discountable"],
        bunit: json["bunit"],
        validityStart: json["validity_start"],
        validityEndUnix: json["validity_end_unix"],
        inson: json["inson"],
        insby: json["insby"],
        imgUrl: json["img_url"],
      );

  Map<String, dynamic> toJson() => {
        "pk": pk,
        "is_combo": isCombo,
        "price_set_id": priceSetId,
        "item_id": itemId,
        "product_name": productName,
        "item_dsc": itemDsc,
        "cost_price": costPrice,
        "mrp": mrp,
        "mrp_excluding_vat": mrpExcludingVat,
        "vat_amount": vatAmount,
        "vat_percent": vatPercent,
        "discount": discount,
        "is_active": isActive,
        "is_discountable": isDiscountable,
        "bunit": bunit,
        "validity_start": validityStart,
        "validity_end_unix": validityEndUnix,
        "inson": inson,
        "insby": insby,
        "img_url": imgUrl,
      };
}

class Link {
  Link({
    required this.rel,
    required this.href,
  });

  String rel;
  String href;

  factory Link.fromJson(Map<String, dynamic> json) => Link(
        rel: json["rel"],
        href: json["href"],
      );

  Map<String, dynamic> toJson() => {
        "rel": rel,
        "href": href,
      };
}
