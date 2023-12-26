// To parse this JSON data, do
//
//     final scannedCouponModel = scannedCouponModelFromJson(jsonString);

import 'dart:convert';

ScannedCouponModel scannedCouponModelFromJson(String str) =>
    ScannedCouponModel.fromJson(json.decode(str));

String scannedCouponModelToJson(ScannedCouponModel data) =>
    json.encode(data.toJson());

class ScannedCouponModel {
  ScannedCouponModel({
    required this.items,
  });

  List<Item> items;

  factory ScannedCouponModel.fromJson(Map<String, dynamic> json) =>
      ScannedCouponModel(
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
      };
}

class Item {
  Item({
    required this.pk,
    required this.qty,
    required this.priceSetId,
    required this.itemId,
    required this.productName,
    required this.cuponCode,
    required this.status,
    required this.consume,
    required this.itemDsc,
    required this.costPrice,
    required this.mrp,
    required this.mrpExcludingVat,
    required this.vatAmount,
    required this.vatPercent,
    required this.discount,
    required this.isDiscountable,
    required this.startDate,
    required this.endDate,
    required this.bunitFk,
  });

  int pk;
  int qty;
  int priceSetId;
  int itemId;
  String productName;
  String cuponCode;
  String? status;
  dynamic consume;
  String itemDsc;
  int costPrice;
  int mrp;
  double mrpExcludingVat;
  double vatAmount;
  double vatPercent;
  int discount;
  int isDiscountable;
  String? startDate;
  String? endDate;
  int bunitFk;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        pk: json["pk"],
        qty: json["qty"],
        priceSetId: json["price_set_id"],
        itemId: json["item_id"],
        productName: json["product_name"],
        cuponCode: json["cupon_code"],
        status: json["status"],
        consume: json["consume"],
        itemDsc: json["item_dsc"],
        costPrice: json["cost_price"],
        mrp: json["mrp"],
        mrpExcludingVat: json["mrp_excluding_vat"].toDouble(),
        vatAmount: json["vat_amount"].toDouble(),
        vatPercent: json["vat_percent"].toDouble(),
        discount: json["discount"],
        isDiscountable: json["is_discountable"],
        startDate: json["start_date"],
        endDate: json["end_date"],
        bunitFk: json["bunit_fk"],
      );

  Map<String, dynamic> toJson() => {
        "pk": pk,
        "qty": qty,
        "price_set_id": priceSetId,
        "item_id": itemId,
        "product_name": productName,
        "cupon_code": cuponCode,
        "status": status,
        "consume": consume,
        "item_dsc": itemDsc,
        "cost_price": costPrice,
        "mrp": mrp,
        "mrp_excluding_vat": mrpExcludingVat,
        "vat_amount": vatAmount,
        "vat_percent": vatPercent,
        "discount": discount,
        "is_discountable": isDiscountable,
        "start_date": startDate,
        "end_date": endDate,
        "bunit_fk": bunitFk,
      };
}
