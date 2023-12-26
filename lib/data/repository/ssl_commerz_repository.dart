import 'package:flutter_babuland_app/data/model/ssl_commerz_transaction_model.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_sslcommerz/model/SSLCTransactionInfoModel.dart';
import 'package:http/http.dart';

class SSLCommerzRepository {
  static Future validateTransaction(String val_id) async {
    final response = await get(Uri.parse(
        // 'https://sandbox.sslcommerz.com/validator/api/validationserverAPI.php?val_id=$val_id&store_id=babul62dd01a4bc6b9&store_passwd=babul62dd01a4bc6b9@ssl&format=json'));
        'https://securepay.sslcommerz.com/validator/api/validationserverAPI.php?val_id=$val_id&store_id=${dotenv.env['SSL_STORE_ID']}&store_passwd=${dotenv.env['SSL_STORE_PASS']}&format=json'));
    if (response.statusCode == 200) {
      final transactionResponse = sslcTransactionModelFromJson(response.body);
      // print(response.body);
      return transactionResponse;
    } else {
      // print(response.body);
      throw Exception('Error SSL Commerz Validation Repository');
    }
  }
}
