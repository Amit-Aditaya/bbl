class MembershipInvoiceArguments {
  int id;
  int duration;
  int price;
  String childName;
  String packageTitle;
  int childId;
  String packageType;
  DateTime? renewalPackMaxDateTime;
  String? renewalPackageCreateDate;

  MembershipInvoiceArguments({
    required this.id,
    required this.duration,
    required this.price,
    required this.childName,
    required this.packageTitle,
    required this.childId,
    required this.packageType,
    required this.renewalPackMaxDateTime,
    required this.renewalPackageCreateDate,
  });
}
