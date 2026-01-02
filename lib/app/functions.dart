import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

Future<void> openUrl(String link) async {
  final Uri url = Uri.parse(link);
  if (!await launchUrl(url)) throw 'Could not launch $url';
}
