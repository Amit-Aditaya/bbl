import 'dart:convert';

ChildrenModel childrenModelFromJson(String str) =>
    ChildrenModel.fromJson(json.decode(str));

String childrenModelToJson(ChildrenModel data) => json.encode(data.toJson());

class ChildrenModel {
  ChildrenModel({
    required this.items,
  });

  List<Item> items;

  factory ChildrenModel.fromJson(Map<String, dynamic> json) => ChildrenModel(
      items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))));

  Map<String, dynamic> toJson() => {
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
      };
}

class Item {
  Item({
    required this.guardianId,
    required this.childId,
    required this.childName,
    required this.gender,
    required this.dateOfBirth,
    required this.eduClass,
    required this.school,
    required this.addedBy,
  });

  int guardianId;
  int childId;
  String childName;
  String gender;
  String dateOfBirth;
  String? eduClass;
  String? school;
  String addedBy;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        guardianId: json["guardian_id"],
        childId: json["child_id"],
        childName: json["child_name"],
        gender: json["gender"],
        dateOfBirth: json["date_of_birth"],
        eduClass: json["edu_class"],
        school: json["school"],
        addedBy: json["added_by"],
      );

  Map<String, dynamic> toJson() => {
        "guardian_id": guardianId,
        "child_id": childId,
        "child_name": childName,
        "gender": gender,
        "date_of_birth": dateOfBirth,
        "edu_class": eduClass,
        "school": school,
        "added_by": addedBy,
      };
}
