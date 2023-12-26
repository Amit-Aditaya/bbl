import 'package:http/http.dart';

class ReviewRepositoy {
  static Future postReview({
    required String mobileNumber,
    required String branchName,
    required int serviceRating,
    required int hygineRating,
    required int childCareRating,
    required int foodRating,
    required int washroomRating,
    required String comments,
  }) async {
    final response = await post(
        Uri.parse('http://apps.babuland.org/bblapi/apiv2/apiv1/review'),
        headers: {
          'PENDING': 'N',
          'MOBILE': mobileNumber,
          'BRANCH': branchName,
          'TICKET_ID': '0',
          'SERVICE': serviceRating.toString(),
          'HYGIENE': hygineRating.toString(),
          'FOOD': foodRating.toString(),
          'WASH_ROOM': washroomRating.toString(),
          'REVIEW_COMMENT': comments,
          'CHILD_SERVICE': childCareRating.toString(),
        });
  }
}
