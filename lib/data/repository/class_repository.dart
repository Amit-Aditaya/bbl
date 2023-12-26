import 'dart:convert';

import 'package:flutter_babuland_app/constants/links/app_link.dart';
import 'package:flutter_babuland_app/data/model/class_model.dart';
import 'package:http/http.dart';

class ClassRepository {
  Future<ClassModel> getClasses() async {
    final response = await get(
        Uri.parse('${AppLink.apiLink}apiv2/apiv3/app_schedule'),
        headers: {"CATEGORY": "Class"});
    if (response.statusCode == 200) {
      final classList = classModelFromJson(utf8.decode(response.bodyBytes));
      return classList;
    } else {
      throw Exception('CLASSS REPOSITORY ERROR');
    }
  }
}
