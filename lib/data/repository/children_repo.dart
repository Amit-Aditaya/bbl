import 'dart:io';

import 'package:flutter_babuland_app/data/model/children_model.dart';
import 'package:http/http.dart';

import '../../constants/links/app_link.dart';

class ChildrenRepository {
  Future<ChildrenModel> getChildren({required String id}) async {
    final response = await get(
        Uri.parse('http://apps.babuland.org/bblapi/apiv2/apiv1/chinfoget/'),
        headers: {'GUARDIAN_ID': id});

    if (response.statusCode == 200) {
      final children = childrenModelFromJson(response.body);
      return children;
    } else {
      throw Exception('CHILD REPO ERROR');
    }
  }

  static Future postChildImage({required int childId, required File f}) async {
    MultipartRequest request = MultipartRequest(
        'POST', Uri.parse('${AppLink.apiLink}apiv2/apiv1/child_img'));
    request.headers.addAll({'child_id': childId.toString()});
    request.files.add(await MultipartFile.fromPath('image', f.path));
    StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
    } else {
      throw Exception('CUSTOMER REPO ERROR (Posting Image)');
    }
  }

  static Future updateChildInfo(
      {required int childId,
      required String childName,
      required String gender,
      required String eduClass,
      required String school}) async {
    return await put(
      Uri.parse('${AppLink.apiLink}apiv2/apiv1/child'),
      headers: {
        'CHILD_ID': childId.toString(),
        'CHILD_NAME': childName,
        'GENDER': gender,
        'EDU_CLASS': eduClass,
        'SCHOOL': school
      },
    ).then((response) {
      if (response.statusCode == 201 || response.statusCode == 200) {
      } else {
        throw Exception('CHILD REPO ERROR (While updating)');
      }
    });
  }

  static Future addAChild({
    required int guardianId,
    required String childName,
    required String gender,
    required String dob,
    required String eduClass,
    required String school,
    required String addedBy,
    //required String? childImageFileName,
  }) async {
    final Response response = await post(
      Uri.parse('http://apps.babuland.org/bblapi/apiv2/apiv1/child'),
      headers: {
        'GUARDIAN_ID': guardianId.toString(),
        'CHILD_NAME': childName,
        'GENDER': gender,
        'DATE_OF_BIRTH': dob,
        'EDU_CLASS': eduClass,
        'SCHOOL': school,
        'ADDED_BY': addedBy,
      },
    );
    // .then((response) {
    //   if (response.statusCode == 201 || response.statusCode == 200) {
    //   } else {
    //     throw Exception('CHILD REPO ERROR (While posting)');
    //   }
    // });

    return response;
  }
}
