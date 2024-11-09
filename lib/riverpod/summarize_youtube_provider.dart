import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/api/summarize_youtube_api.dart';

// Define a FutureProvider to summarize the YouTube link
final youtubeSummaryProvider = FutureProvider.family<String, String>((ref, link) async {
  return await summarizeYoutubeLink(link);
});