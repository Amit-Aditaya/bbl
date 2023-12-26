import 'package:http/http.dart';

class MimSmsRepository {
  static Future sendSMS(
      {required String apiKey,
      required String type,
      required String customerPhoneNumber,
      required String bicPhoneNumber,
      required String message,
      required String label,
      required int senderPhoneNumber}) async {
    final response = await post(
      Uri.parse(
          'https://esms.mimsms.com/smsapi?api_key=C20069265f4e550ccdf622.64468483&type=text&contacts=8801911817331&msg=বাবুল্যান্ড অ্যাপে 88$customerPhoneNumber- নাম্বারটি পার্টির জন্য বুকিং দিয়েছে&label=notification&senderid=8809601000389'),
      headers: {
        'api_key': apiKey,
        'type': type,
        'contacts': customerPhoneNumber,
        'msg': message,
        'label': label,
        'senderid': senderPhoneNumber.toString(),
      },
    );
  }
}
