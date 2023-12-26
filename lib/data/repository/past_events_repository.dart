import 'dart:convert';

import 'package:flutter_babuland_app/constants/links/app_link.dart';
import 'package:flutter_babuland_app/data/model/past_event_model.dart';
import 'package:http/http.dart';

class PastEventRepository {
  Future<PastEventModel> getPastEvents() async {
    final response =
        await get(Uri.parse('${AppLink.apiLink}apiv2/apiv3/appeventsexp'));
    if (response.statusCode == 200) {
      final pastEvents =
          pastEventModelFromJson(utf8.decode(response.bodyBytes));
      return pastEvents;
    } else {
      throw Exception('PAST EVENT REPOSITORY ERROR');
    }
  }
}
