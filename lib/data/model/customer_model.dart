import 'dart:convert';

CustomerModel customerModelFromJson(String str) =>
    CustomerModel.fromJson(json.decode(str));

String customerModelToJson(CustomerModel data) => json.encode(data.toJson());

class CustomerModel {
  CustomerModel({
    required this.items,
  });

  List<Item> items;

  factory CustomerModel.fromJson(Map<String, dynamic> json) => CustomerModel(
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
      };
}

class Item {
  Item({
    required this.id,
    required this.mrMrs,
    required this.fullname,
    required this.spouseName,
    required this.mobileNumber,
    required this.emailAddress,
    required this.address,
    required this.pBranch,
    required this.lastUpdateBy,
    required this.regDate,
  });

  int id;
  String? mrMrs;
  String? fullname;
  String? spouseName;
  String mobileNumber;
  String? emailAddress;
  String? address;
  String? pBranch;
  String? lastUpdateBy;
  String? regDate;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        id: json["id"],
        mrMrs: json["mr_mrs"],
        fullname: json["fullname"],
        spouseName: json["spouse_name"],
        mobileNumber: json["mobile_number"],
        emailAddress: json["email_address"],
        address: json["address"],
        pBranch: json["p_branch"],
        lastUpdateBy: json["last_update_by"],
        regDate: json["reg_date"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "mr_mrs": mrMrs,
        "fullname": fullname,
        "spouse_name": spouseName,
        "mobile_number": mobileNumber,
        "email_address": emailAddress,
        "address": address,
        "p_branch": pBranch,
        "last_update_by": lastUpdateBy,
        "reg_date": regDate,
      };
}
