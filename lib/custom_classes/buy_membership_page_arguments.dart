class BuyMembershipPageArguments {
  int regularPrice;
  int offerPrice;
  int duration;
  String packageValue;
  int packageId;
  String packageName;
  String packageTitle;
  String packageType;
  BuyMembershipPageArguments({
    required this.regularPrice,
    required this.offerPrice,
    required this.duration,
    required this.packageValue,
    required this.packageId,
    required this.packageName,
    required this.packageTitle,
    required this.packageType,
  });
  // final MembershipCard membershipCard;
  // BuyMembershipPageArguments({
  //   required this.membershipCard,
  // });
}
