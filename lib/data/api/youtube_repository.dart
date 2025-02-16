// Providers
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../constants/constants.dart';

class YoutubeRepository {
  Future<String> getSummary(String link) async {
    final url = Uri.parse("${Constants.rootURL}/youtube/summary2");

    try {
      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: json.encode({"link": link}),
      );

      if (response.statusCode == 200) {
        // Decode the response as UTF-8 explicitly
        final utf8Body = utf8.decode(response.bodyBytes);
        final replaced = utf8Body.replaceAll(r'\n', '\n');
        final trimmed = (replaced.startsWith('"') && replaced.endsWith('"'))
            ? replaced.substring(1, replaced.length - 1)
            : replaced;
        return trimmed;
      } else {
        throw Exception("Failed to load summary. Status code: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("An error occurred: $e");
    }
  }
}