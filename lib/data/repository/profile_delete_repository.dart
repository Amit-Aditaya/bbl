import 'package:http/http.dart';

class ProfileDelteRepository {
  static Future deleteProfile(
      {required String mobileNumber, required String customerId}) async {
    final response = await post(
        Uri.parse(
            'http://apps.babuland.org/bblapi/apiv2/api6/setnullmembership'),
        headers: {
          'MEMBERSHIP_ID': customerId,
          'MOBILE_NUMBER': '0$mobileNumber',
        });
    return response;
  }
}
