import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/api/youtube_repository.dart';

// Youtube Repository Provider
final youtubeRepositoryProvider = Provider<YoutubeRepository>((ref) {
  return YoutubeRepository();
});

// 링크에 따라 요약을 가져옴.
final youtubeSummaryProvider = FutureProvider.family<String, String>((ref, link) async {
  final repository = ref.watch(youtubeRepositoryProvider);
  return await repository.getSummary(link);
});