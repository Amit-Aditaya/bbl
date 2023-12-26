import 'dart:convert';

TicketOrderModel ticketOrderModelFromJson(String str) =>
    TicketOrderModel.fromJson(json.decode(str));

String ticketOrderModelToJson(TicketOrderModel data) =>
    json.encode(data.toJson());

class TicketOrderModel {
  TicketOrderModel({
    required this.items,
  });

  List<Item> items;

  factory TicketOrderModel.fromJson(Map<String, dynamic> json) =>
      TicketOrderModel(
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
      };
}

class Item {
  Item(
      {required this.pk,
      required this.customerIdFk,
      required this.mobileNumber,
      required this.total,
      required this.discountAmount,
      required this.subTotal,
      required this.receivedAmount,
      required this.returnAmount,
      required this.paymentType,
      required this.sellPerson,
      required this.bunitFk,
      required this.sellDate,
      required this.couponCode,
      required this.vat,
      required this.slType,
      required this.trnId,
      required this.discountAble,
      required this.discountCoupon,
      required this.discountPct,
      required this.vatableAmt,
      required this.netAmt,
      required this.appAvil,
      required this.unixtimestamp,
      required this.usedBunitId,
      required this.useDate,
      required this.startDate});

  int pk;
  dynamic customerIdFk;
  String mobileNumber;
  int total;
  int discountAmount;
  double subTotal;
  int receivedAmount;
  int returnAmount;
  String paymentType;
  String sellPerson;
  int bunitFk;
  String sellDate;
  dynamic couponCode;
  double vat;
  dynamic slType;
  dynamic trnId;
  int discountAble;
  dynamic discountCoupon;
  int discountPct;
  int vatableAmt;
  double netAmt;
  dynamic appAvil;
  dynamic unixtimestamp;
  dynamic usedBunitId;
  dynamic useDate;
  dynamic startDate;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        pk: json["pk"],
        customerIdFk: json["customer_id_fk"],
        mobileNumber: json["mobile_number"],
        total: json["total"],
        discountAmount: json["discount_amount"],
        subTotal: json["sub_total"].toDouble(),
        receivedAmount: json["received_amount"],
        returnAmount: json["return_amount"],
        paymentType: json["payment_type"],
        sellPerson: json["sell_person"],
        bunitFk: json["bunit_fk"],
        // sellDate: DateTime.parse(json["sell_date"]),
        sellDate: json['sell_date'],
        couponCode: json["coupon_code"],
        vat: json["vat"].toDouble(),
        slType: json["sl_type"],
        trnId: json["trn_id"],
        discountAble: json["discount_able"],
        discountCoupon: json["discount_coupon"],
        discountPct: json["discount_pct"],
        vatableAmt: json["vatable_amt"],
        netAmt: json["net_amt"].toDouble(),
        appAvil: json["app_avil"],
        unixtimestamp: json["unixtimestamp"],
        usedBunitId: json["used_bunit_id"],
        useDate: json["use_date"],
        startDate: json["start_date"],
      );

  Map<String, dynamic> toJson() => {
        "pk": pk,
        "customer_id_fk": customerIdFk,
        "mobile_number": mobileNumber,
        "total": total,
        "discount_amount": discountAmount,
        "sub_total": subTotal,
        "received_amount": receivedAmount,
        "return_amount": returnAmount,
        "payment_type": paymentType,
        "sell_person": sellPerson,
        "bunit_fk": bunitFk,
        // "sell_date": sellDate.toIso8601String(),
        "sell_date": sellDate,
        "coupon_code": couponCode,
        "vat": vat,
        "sl_type": slType,
        "trn_id": trnId,
        "discount_able": discountAble,
        "discount_coupon": discountCoupon,
        "discount_pct": discountPct,
        "vatable_amt": vatableAmt,
        "net_amt": netAmt,
        "app_avil": appAvil,
        "unixtimestamp": unixtimestamp,
        "used_bunit_id": usedBunitId,
        "use_date": useDate,
        "start_date": startDate
      };
}
