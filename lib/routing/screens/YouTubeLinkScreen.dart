import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../riverpod/summarize_youtube_provider.dart';

class YouTubeLinkScreen extends ConsumerWidget {
  final String link;

  const YouTubeLinkScreen({super.key, required this.link});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch the youtubeSummaryProvider for the given link
    final summaryAsyncValue = ref.watch(youtubeSummaryProvider(link));

    return Scaffold(
      appBar: AppBar(
        title: const Text('YouTube Summary'),
      ),
      body: Center(
        child: summaryAsyncValue.when(
          data: (summary) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'YouTube Link:',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  SelectableText(
                    link,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Summary:',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    summary,
                    style: const TextStyle(fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            );
          },
          loading: () => const CircularProgressIndicator(), // Show a loading indicator
          error: (error, stack) => Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Failed to load summary: $error',
              style: const TextStyle(color: Colors.red),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}