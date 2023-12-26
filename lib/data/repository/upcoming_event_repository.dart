import 'dart:convert';

import 'package:flutter_babuland_app/constants/links/app_link.dart';
import 'package:flutter_babuland_app/data/model/upcoming_event_model.dart';
import 'package:http/http.dart';

class UpcomingEventRepository {
  Future<UpcomingEventModel> getUpcomingEvents() async {
    final response =
        await get(Uri.parse('${AppLink.apiLink}apiv2/apiv3/appevents'));
    if (response.statusCode == 200) {
      final upcomingEvents =
          upcomingEventModelFromJson(utf8.decode(response.bodyBytes));
      return upcomingEvents;
    } else {
      throw Exception('UPCOMING EVENT REPOSITORY ERROR');
    }
  }
}
