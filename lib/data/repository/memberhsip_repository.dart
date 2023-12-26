import 'dart:io';

import 'package:flutter_babuland_app/constants/links/app_link.dart';
import 'package:flutter_babuland_app/data/model/membership_model.dart';
import 'package:http/http.dart';

class MembershipRepository {
  Future<MembershipModel> getMembershipPackages() async {
    final response = await get(
        Uri.parse('${AppLink.apiLink}apiv2/apiv1/memberpkg'),
        headers: {"PACKAGE_TYPE": 'Normal'});
    if (response.statusCode == 200) {
      final membershipPacks = membershipModelFromJson(response.body);
      return membershipPacks;
    } else {
      throw Exception('MEMBERSHIP REPOSITORY ERROR');
    }
  }

  static Future<MembershipModel> getNormalMembershipPackages() async {
    final response = await get(
        Uri.parse('${AppLink.apiLink}apiv2/apiv1/memberpkg'),
        headers: {"PACKAGE_TYPE": 'Normal'});
    if (response.statusCode == 200) {
      final membershipPacks = membershipModelFromJson(response.body);
      return membershipPacks;
    } else {
      throw Exception('MEMBERSHIP REPOSITORY ERROR');
    }
  }

  static Future<MembershipModel> getRenewalMembershipPackages() async {
    final response = await get(
        Uri.parse('${AppLink.apiLink}apiv2/apiv1/memberpkg'),
        headers: {"PACKAGE_TYPE": 'Renewal'});
    if (response.statusCode == 200) {
      final membershipPacks = membershipModelFromJson(response.body);
      return membershipPacks;
    } else {
      throw Exception('MEMBERSHIP REPOSITORY ERROR');
    }
  }

  static Future<MembershipModel> getFamilyMembershipPackages() async {
    final response = await get(
        Uri.parse('${AppLink.apiLink}apiv2/apiv1/memberpkg'),
        headers: {"PACKAGE_TYPE": 'Family'});
    if (response.statusCode == 200) {
      final membershipPacks = membershipModelFromJson(response.body);
      return membershipPacks;
    } else {
      throw Exception('MEMBERSHIP REPOSITORY ERROR');
    }
  }

  static Future postMembershipPurchase({
    required String createdDate,
    required String packageType,
    required String trxId,
    required String mobileNumber,
    required String expDate,
    required String customerId,
    required String childId,
    required int pkgId,
  }) async {
    final Response response = await post(
      Uri.parse('http://apps.babuland.org/bblapi/apiv2/apiv2/membership'),
      headers: {
        'CREATE_DATE': createdDate,
        'CREATED_BY': Platform.isAndroid ? 'Android' : 'IOS',
        'PAYMENT_TYPE': 'SSLCOMMERZ',
        'PAYMENT_VERIFIED_BY': 'APP',
        'PAYMENT_COMMENT': Platform.isAndroid
            ? 'Payment with Flutter Android SSLCommerz'
            : 'Payment with Flutter IOS SSLCommerz',
        'PAYMENT_VERIFIES_COMMENT': 'No comment',
        'TRX_ID': trxId,
        'MOBILE_NUMBER': mobileNumber,
        'EXPIRE_DATE': expDate,
        'MEMBER_ID': customerId,
        'CHILD_ID': childId,
        'PKG_ID': pkgId.toString(),
        'PKG_TYPE': packageType,
      },
    );
    return response;
  }

  static Future postMembershipPayment({
    required double totalAmount,
    required int customerId,
    required int childId,
    required int membershipPackageid,
    required int mId, //lid that is returned after posting
    required int packageId, // membership package id
  }) async {
    return await post(
        Uri.parse(
            'http://apps.babuland.org/bblapi/apiv2/apiv3/payment_information'),
        headers: {
          'PAYMENT_TYPE': Platform.isAndroid
              ? 'Full Payment (Android)'
              : 'Full Payment IOS',
          'MAP_AMOUNT': totalAmount.toString(),
          'PKG_ID': mId.toString(),
          'M_ID': customerId.toString(),
          'CHILD_ID': childId.toString(),
          'PAY_TYPE': 'SSLCommerz',
          'MEMBERSHIP_PKG_ID': membershipPackageid.toString(),
        }).then((response) {
      if (response.statusCode == 200) {
      } else {
        throw Exception('MEMBERSHIP PURCHASE ERROR (While Payment)');
      }
    });
  }
}
