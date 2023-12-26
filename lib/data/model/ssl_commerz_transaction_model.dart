// To parse this JSON data, do
//
//     final sslcTransactionModel = sslcTransactionModelFromJson(jsonString);

import 'dart:convert';

SslcTransactionModel sslcTransactionModelFromJson(String str) =>
    SslcTransactionModel.fromJson(json.decode(str));

String sslcTransactionModelToJson(SslcTransactionModel data) =>
    json.encode(data.toJson());

class SslcTransactionModel {
  SslcTransactionModel({
    required this.status,
    required this.tranDate,
    required this.tranId,
    required this.valId,
    required this.amount,
    required this.storeAmount,
    required this.currency,
    required this.bankTranId,
    required this.cardType,
    required this.cardNo,
    required this.cardIssuer,
    required this.cardBrand,
    required this.cardCategory,
    required this.cardSubBrand,
    required this.cardIssuerCountry,
    required this.cardIssuerCountryCode,
    required this.currencyType,
    required this.currencyAmount,
    required this.currencyRate,
    required this.baseFair,
    required this.valueA,
    required this.valueB,
    required this.valueC,
    required this.valueD,
    required this.emiInstalment,
    required this.emiAmount,
    required this.emiDescription,
    required this.emiIssuer,
    required this.accountDetails,
    required this.riskTitle,
    required this.riskLevel,
    required this.discountPercentage,
    required this.discountAmount,
    required this.discountRemarks,
    required this.apiConnect,
    required this.validatedOn,
    required this.gwVersion,
    required this.offerAvail,
    required this.cardRefId,
    required this.isTokeizeSuccess,
    required this.campaignCode,
  });

  String status;
  DateTime tranDate;
  String tranId;
  String valId;
  String amount;
  String storeAmount;
  String currency;
  String bankTranId;
  String cardType;
  String cardNo;
  String cardIssuer;
  String cardBrand;
  String cardCategory;
  String cardSubBrand;
  String cardIssuerCountry;
  String cardIssuerCountryCode;
  String currencyType;
  String currencyAmount;
  String currencyRate;
  String baseFair;
  String valueA;
  String valueB;
  String valueC;
  String valueD;
  String emiInstalment;
  String emiAmount;
  String emiDescription;
  String emiIssuer;
  String accountDetails;
  String riskTitle;
  String riskLevel;
  String discountPercentage;
  String discountAmount;
  String discountRemarks;
  String apiConnect;
  DateTime validatedOn;
  String gwVersion;
  int offerAvail;
  String cardRefId;
  int isTokeizeSuccess;
  String campaignCode;

  factory SslcTransactionModel.fromJson(Map<String, dynamic> json) =>
      SslcTransactionModel(
        status: json["status"],
        tranDate: DateTime.parse(json["tran_date"]),
        tranId: json["tran_id"],
        valId: json["val_id"],
        amount: json["amount"],
        storeAmount: json["store_amount"],
        currency: json["currency"],
        bankTranId: json["bank_tran_id"],
        cardType: json["card_type"],
        cardNo: json["card_no"],
        cardIssuer: json["card_issuer"],
        cardBrand: json["card_brand"],
        cardCategory: json["card_category"],
        cardSubBrand: json["card_sub_brand"],
        cardIssuerCountry: json["card_issuer_country"],
        cardIssuerCountryCode: json["card_issuer_country_code"],
        currencyType: json["currency_type"],
        currencyAmount: json["currency_amount"],
        currencyRate: json["currency_rate"],
        baseFair: json["base_fair"],
        valueA: json["value_a"],
        valueB: json["value_b"],
        valueC: json["value_c"],
        valueD: json["value_d"],
        emiInstalment: json["emi_instalment"],
        emiAmount: json["emi_amount"],
        emiDescription: json["emi_description"],
        emiIssuer: json["emi_issuer"],
        accountDetails: json["account_details"],
        riskTitle: json["risk_title"],
        riskLevel: json["risk_level"],
        discountPercentage: json["discount_percentage"],
        discountAmount: json["discount_amount"],
        discountRemarks: json["discount_remarks"],
        apiConnect: json["APIConnect"],
        validatedOn: DateTime.parse(json["validated_on"]),
        gwVersion: json["gw_version"],
        offerAvail: json["offer_avail"],
        cardRefId: json["card_ref_id"],
        isTokeizeSuccess: json["isTokeizeSuccess"],
        campaignCode: json["campaign_code"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "tran_date": tranDate,
        "tran_id": tranId,
        "val_id": valId,
        "amount": amount,
        "store_amount": storeAmount,
        "currency": currency,
        "bank_tran_id": bankTranId,
        "card_type": cardType,
        "card_no": cardNo,
        "card_issuer": cardIssuer,
        "card_brand": cardBrand,
        "card_category": cardCategory,
        "card_sub_brand": cardSubBrand,
        "card_issuer_country": cardIssuerCountry,
        "card_issuer_country_code": cardIssuerCountryCode,
        "currency_type": currencyType,
        "currency_amount": currencyAmount,
        "currency_rate": currencyRate,
        "base_fair": baseFair,
        "value_a": valueA,
        "value_b": valueB,
        "value_c": valueC,
        "value_d": valueD,
        "emi_instalment": emiInstalment,
        "emi_amount": emiAmount,
        "emi_description": emiDescription,
        "emi_issuer": emiIssuer,
        "account_details": accountDetails,
        "risk_title": riskTitle,
        "risk_level": riskLevel,
        "discount_percentage": discountPercentage,
        "discount_amount": discountAmount,
        "discount_remarks": discountRemarks,
        "APIConnect": apiConnect,
        "validated_on": validatedOn.toIso8601String(),
        "gw_version": gwVersion,
        "offer_avail": offerAvail,
        "card_ref_id": cardRefId,
        "isTokeizeSuccess": isTokeizeSuccess,
        "campaign_code": campaignCode,
      };
}
