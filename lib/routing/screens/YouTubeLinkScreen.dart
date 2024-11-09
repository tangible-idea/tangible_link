import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:tangible_link/styles/app_sizes.dart';
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
      body: summaryAsyncValue.when(
        data: (summary) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Text(
                      'YouTube Link:',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    gapW8,
                    SelectableText(
                      link,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ],
                ),
                gapH8,
                const Text(
                  'Summary:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                gapH8,
                // Make the summary scrollable
                // Make the Markdown scrollable
                Expanded(
                  child: Markdown(
                    data: summary, // Render the summary as markdown
                    selectable: true, // Allow users to select and copy the text
                    styleSheet: MarkdownStyleSheet.fromTheme(Theme.of(context)).copyWith(
                      p: const TextStyle(fontSize: 16), // Customize the paragraph style
                    ),
                  ),
                ),
              ],
            ),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()), // Show a loading indicator
        error: (error, stack) => Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'Failed to load summary: $error',
            style: const TextStyle(color: Colors.red),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}