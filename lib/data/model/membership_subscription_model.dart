import 'dart:convert';

MembershipSubscriptionModel membershipSubscriptionModelFromJson(String str) =>
    MembershipSubscriptionModel.fromJson(json.decode(str));

String membershipSubscriptionModelToJson(MembershipSubscriptionModel data) =>
    json.encode(data.toJson());

class MembershipSubscriptionModel {
  MembershipSubscriptionModel({
    required this.items,
  });

  List<Item> items;

  factory MembershipSubscriptionModel.fromJson(Map<String, dynamic> json) =>
      MembershipSubscriptionModel(
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
      };
}

class Item {
  Item({
    required this.pkgName,
    required this.packageTitle,
    required this.memberName,
    required this.packagePrice,
    required this.regularPrice,
    required this.packageValue,
    required this.packageTime,
    required this.paymentType,
    required this.createDate,
    required this.pkgId,
    required this.memberId,
    required this.chaildId,
    required this.chaildName,
    required this.expireDate,
    required this.paymentVerifiedTimestamp,
    required this.childImgUrl,
  });

  String pkgName;
  String packageTitle;
  String memberName;
  int packagePrice;
  int regularPrice;
  String packageValue;
  int packageTime;
  String paymentType;
  String createDate;
  int pkgId;
  int memberId;
  int chaildId;
  String chaildName;
  String expireDate;
  String paymentVerifiedTimestamp;
  String childImgUrl;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        pkgName: json["pkg_name"],
        packageTitle: json["package_title"] ?? 'null',
        memberName: json["member_name"],
        packagePrice: json["package_price"],
        regularPrice: json["regular_price"],
        packageValue: json["package_value"],
        packageTime: json["package_time"],
        paymentType: json["payment_type"],
        createDate: json["create_date"],
        pkgId: json["pkg_id"],
        memberId: json["member_id"],
        chaildId: json["chaild_id"],
        chaildName: json["chaild_name"],
        expireDate: json["expire_date"] ?? '01/01/1966',
        paymentVerifiedTimestamp:
            json["payment_verified_timestamp"] ?? '01/01/1966',
        childImgUrl: json["child_img_url"],
      );

  Map<String, dynamic> toJson() => {
        "pkg_name": pkgName,
        "package_title": packageTitle == null ? null : packageTitle,
        "member_name": memberName,
        "package_price": packagePrice,
        "regular_price": regularPrice,
        "package_value": packageValue,
        "package_time": packageTime,
        "payment_type": paymentType,
        "create_date": createDate,
        "pkg_id": pkgId,
        "member_id": memberId,
        "chaild_id": chaildId,
        "chaild_name": chaildName,
        "expire_date": expireDate == null ? null : expireDate,
        "payment_verified_timestamp":
            paymentVerifiedTimestamp == null ? null : paymentVerifiedTimestamp,
        "child_img_url": childImgUrl,
      };
}
