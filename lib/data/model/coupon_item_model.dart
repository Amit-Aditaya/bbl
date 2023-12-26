import 'dart:convert';

CouponItemModel couponItemModelFromJson(String str) =>
    CouponItemModel.fromJson(json.decode(str));

String couponItemModelToJson(CouponItemModel data) =>
    json.encode(data.toJson());

class CouponItemModel {
  CouponItemModel({
    required this.items,
  });

  List<Item> items;

  factory CouponItemModel.fromJson(Map<String, dynamic> json) =>
      CouponItemModel(
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
      };
}

class Item {
  Item({
    required this.pk,
    required this.coupon,
    required this.discPct,
    required this.bunitFk,
    required this.startDate,
    required this.expDate,
    required this.insby,
    required this.inson,
    required this.couponQty,
    required this.consumed,
  });

  int pk;
  String coupon;
  int discPct;
  int bunitFk;
  String startDate;
  String expDate;
  String insby;
  String inson;
  int couponQty;
  dynamic consumed;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        pk: json["pk"],
        coupon: json["coupon"],
        discPct: json["disc_pct"],
        bunitFk: json["bunit_fk"],
        startDate: json["start_date"],
        expDate: json["exp_date"],
        insby: json["insby"],
        inson: json["inson"],
        couponQty: json["coupon_qty"],
        consumed: json["consumed"],
      );

  Map<String, dynamic> toJson() => {
        "pk": pk,
        "coupon": coupon,
        "disc_pct": discPct,
        "bunit_fk": bunitFk,
        "start_date": startDate,
        "exp_date": expDate,
        "insby": insby,
        "inson": inson,
        "coupon_qty": couponQty,
        "consumed": consumed,
      };
}
