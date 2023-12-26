import 'dart:convert';

OfferItemModel offerItemModelFromJson(String str) =>
    OfferItemModel.fromJson(json.decode(str));

String offerItemModelToJson(OfferItemModel data) => json.encode(data.toJson());

class OfferItemModel {
  OfferItemModel({
    required this.items,
  });

  List<Item> items;

  factory OfferItemModel.fromJson(Map<String, dynamic> json) => OfferItemModel(
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
      };
}

class Item {
  Item({
    required this.pk,
    required this.comboItemPrice,
    required this.qty,
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
    required this.isDiscountable,
    required this.bunitFk,
    required this.unitName,
  });

  int pk;
  int comboItemPrice;
  int qty;
  int priceSetId;
  int itemId;
  String productName;
  dynamic itemDsc;
  int costPrice;
  int mrp;
  double mrpExcludingVat;
  double vatAmount;
  double vatPercent;
  int discount;
  int isDiscountable;
  int bunitFk;
  String unitName;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        pk: json["pk"],
        comboItemPrice: json["combo_item_price"],
        qty: json["qty"],
        priceSetId: json["price_set_id"],
        itemId: json["item_id"],
        productName: json["product_name"],
        itemDsc: json["item_dsc"],
        costPrice: json["cost_price"],
        mrp: json["mrp"],
        mrpExcludingVat: json["mrp_excluding_vat"].toDouble(),
        vatAmount: json["vat_amount"].toDouble(),
        vatPercent: json["vat_percent"].toDouble(),
        discount: json["discount"],
        isDiscountable: json["is_discountable"],
        bunitFk: json["bunit_fk"],
        unitName: json["unit_name"],
      );

  Map<String, dynamic> toJson() => {
        "pk": pk,
        "combo_item_price": comboItemPrice,
        "qty": qty,
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
        "is_discountable": isDiscountable,
        "bunit_fk": bunitFk,
        "unit_name": unitName,
      };
}
