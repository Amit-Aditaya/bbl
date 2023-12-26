import 'package:url_launcher/url_launcher.dart';

class MapDirectionRepository {
  MapDirectionRepository._();

  static Future<void> openMap(
      double originLat, double originLang, String destination) async {
    String googleMapsUrl =
        'https://www.google.com/maps/dir/?api=1&origin=Your+Location&destination=$destination&travelmode=driving';
    if (await canLaunch(googleMapsUrl)) {
      await launch(googleMapsUrl);
    } else {
      throw 'Could not open the map';
    }
  }
}
