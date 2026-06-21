import 'package:url_launcher/url_launcher.dart';

Future<bool> openUrl(String url) =>
    launchUrl(Uri.parse(url), mode: .externalApplication);

Future<bool> openUri(Uri uri) =>
    launchUrl(uri, mode: .externalApplication);
