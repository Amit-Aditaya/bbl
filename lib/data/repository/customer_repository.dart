import 'dart:io';

import 'package:flutter_babuland_app/constants/links/app_link.dart';
import 'package:flutter_babuland_app/custom_classes/hive_box_utils.dart';
import 'package:flutter_babuland_app/data/model/current_user.dart';
import 'package:flutter_babuland_app/data/model/customer_model.dart';
import 'package:http/http.dart';

class CustomerRepository {
  CurrentUser currentUser = HiveBoxUtils.box.get('user_current');
  Future<CustomerModel> getCustomer() async {
    final response = await get(
        Uri.parse('${AppLink.apiLink}apiv2/apiv1/member'),
        headers: {'MOBILE_NUMBER': currentUser.phoneNumber!.substring(3)});
    if (response.statusCode == 200) {
      final customer = customerModelFromJson(response.body);
      return customer;
    } else {
      throw Exception('CUSTOMER REPO ERROR');
    }
  }

  static Future updateCustomerInfo({
    required int customerId,
    required String customerGender,
    required String customerName,
    required String customerSpouseName,
    required String emailAddress,
    required String address,
    required String prefferedBranch,
  }) {
    return put(Uri.parse('${AppLink.apiLink}apiv2/apiv1/member'), headers: {
      'id': customerId.toString(),
      'FULLNAME': customerName,
      'SPOUSE_NAME': customerSpouseName,
      'ADDRESS': address,
      'P_BRANCH': prefferedBranch,
      'MR_MRS': customerGender
    }).then((response) {
      if (response.statusCode == 201 || response.statusCode == 200) {
      } else {
        throw Exception('CUSTOMER REPO ERROR (Update)');
      }
    });
  }

  static Future postCustomerImage(
      {required int customerId, required File f}) async {
    MultipartRequest request = MultipartRequest(
        'POST', Uri.parse('${AppLink.apiLink}apiv2/apiv1/member_img'));
    request.headers.addAll({'member_id': customerId.toString()});
    request.files.add(await MultipartFile.fromPath('image', f.path));
    StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
    } else {
      throw Exception('CUSTOMER REPO ERROR (Posting Image)');
    }
  }

  static Future postCustomerInfo({required String mobileNumber}) async {
    final response = await post(
        Uri.parse('http://apps.babuland.org/bblapi/apiv2/apiv1/member'),
        headers: {
          'MR_MRS': '',
          'FULLNAME': '',
          'SPOUSE_NAME': '',
          'MOBILE_NUMBER': mobileNumber,
          'EMAIL_ADDRESS': '',
          'ADDRESS': '',
          'UPDATE_BY': Platform.isAndroid ? 'Android' : 'IOS',
        });
  }

  static Future<CustomerModel> getCustomerByMobileNumber(
      {required String mobileNumber}) async {
    final response = await get(
        Uri.parse('${AppLink.apiLink}apiv2/apiv1/member'),
        headers: {'MOBILE_NUMBER': mobileNumber});
    if (response.statusCode == 200) {
      final customer = customerModelFromJson(response.body);
      return customer;
    } else {
      throw Exception('CUSTOMER REPO ERROR');
    }
  }
}
