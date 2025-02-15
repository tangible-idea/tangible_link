// Providers
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../constants/constants.dart';

// API call function
Future<String> summarizeYoutubeLink(String link) async {

  final url = Uri.parse("${Constants.rootURL}/youtube/summary2");
  final response = await http.post(
    url,
    headers: {"Content-Type": "application/json"},
    body: json.encode({
      "link": link
    }),
  );

  if (response.statusCode == 200) {

    // Decode the response body as UTF-8 explicitly
    final utf8Body = utf8.decode(response.bodyBytes);
    final replaced= utf8Body.replaceAll(r'\n', '\n');

    // Remove surrounding double quotes if they exist
    final trimmed = (replaced.startsWith('"') && replaced.endsWith('"'))
        ? replaced.substring(1, replaced.length - 1)
        : replaced;

    return trimmed;
  } else {
    var failedMessage= "No valid YouTube link in clipboard. \nStatus code: ${response.statusCode}";
    print(failedMessage);
    return failedMessage;
  }
}