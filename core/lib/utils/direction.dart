import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

void openUrlMaps(LatLng destination, {LatLng? origin}) async {
  String parameters = [
    origin != null ? "origin=${origin.latitude},${origin.longitude}" : "",
    "destination=${destination.latitude},${destination.longitude}",
    "travelmode=driving",
    "dir_action=navigate"
  ].join("&");
  final url = "https://www.google.com/maps/dir/?api=1&$parameters";

  if (await canLaunch(url)) {
    await launch(url);
  }
}
