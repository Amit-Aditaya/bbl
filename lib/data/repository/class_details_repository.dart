import 'package:flutter_babuland_app/constants/links/app_link.dart';
import 'package:flutter_babuland_app/data/model/class_details_model.dart';
import 'package:http/http.dart';

class ClassDetailsRepository {
  final int id;
  ClassDetailsRepository({
    required this.id,
  });

  Future<ClassDetailsModel> getClassDetails() async {
    final response = await get(
        Uri.parse('${AppLink.apiLink}apiv2/apiv3/app_schedule_details'),
        headers: {'SCHEDULE_ID': id.toString()});

    if (response.statusCode == 200) {
      final classDetails = classDetailsModelFromJson(response.body);
      return classDetails;
    } else {
      throw Exception('CLASS DETAILS REPOSITORY ERROR');
    }
  }
}
