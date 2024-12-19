// youtube_link_screen.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/services.dart';
import 'package:tangible_link/styles/app_sizes.dart';
import '../../data/ClipboardUtils.dart';
import '../../riverpod/summarize_youtube_provider.dart';
import '../../widgets/ProfileHeader.dart';
import '../../widgets/markdown_page.dart';
import '../app_router.dart';

class YouTubeLinkScreen extends ConsumerWidget {
  final String link;

  const YouTubeLinkScreen({super.key, required this.link});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch the youtubeSummaryProvider for the given link
    var actualLink = link;
    final summaryAsyncValue = ref.watch(youtubeSummaryProvider(actualLink));

    return SafeArea(
      child: Scaffold(
          appBar: ProfileHeader(
            iconData: Icons.history,
            onIconTap: () {
              ref.read(goRouterProvider).go('/home'); // Navigate to home
          }),
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
                        actualLink,
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
                  Expanded(
                      child: MarkdownPage(summary)
                  ),
                ],
              ),
            );
          },
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, stack) => Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Failed to load summary: $error',
              style: const TextStyle(color: Colors.red),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            final clipboardLink = await ClipboardUtils.getYouTubeLinkFromClipboard();
            if (clipboardLink != null) {
              ref.read(goRouterProvider).go('/youtube-link?link=$clipboardLink');
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('No valid YouTube link in clipboard')),
              );
            }
          },
          child: const Icon(Icons.copy),
          tooltip: 'Copy link',
        ),
      ),
    );
  }
}