// youtube_link_screen.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:tangible_link/styles/app_sizes.dart';
import '../../data/ClipboardUtils.dart';
import '../../riverpod/simple_state_provider.dart';
import '../../riverpod/summarize_youtube_provider.dart';
import '../../widgets/ProfileHeader.dart';
import '../../widgets/markdown_page.dart';
import '../app_router.dart';

class YouTubeLinkScreen extends ConsumerWidget {
  final String link;

  const YouTubeLinkScreen({super.key, required this.link});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final linkController = TextEditingController(text: link);


    ref.listen<String>(youtubeLinkProvider, (previous, next) {
      debugPrint("🔄 youtubeLinkProvider 변경됨: $next");
    });

    /**
     * Start analyze Youtube link.
     */
    Future<void> runYoutube() async {
      final clipboardLink = await ClipboardUtils.getYouTubeLinkFromClipboard();
      if (clipboardLink != null) {
        ref.read(goRouterProvider).go('/youtube-link?link=$clipboardLink');
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('No valid YouTube link in clipboard')),
        );
      }
    }

    // 위젯이 처음 빌드된 후 한 번만 실행되도록 함
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final clipboardLink = await ClipboardUtils.getYouTubeLinkFromClipboard();
      debugPrint("📋 클립보드에서 가져온 링크: $clipboardLink");

      final currentLink = ref.read(youtubeLinkProvider);
      if (clipboardLink != null && clipboardLink != currentLink) {
        ref.read(youtubeLinkProvider.notifier).state = clipboardLink;
      }
    });

    var actualLink = ref.watch(youtubeLinkProvider);

    // Watch the youtubeSummaryProvider for the given link
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
                        'Link:',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      gapW8,
                      Expanded(
                        child: TextField(
                          controller: linkController,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.blue,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                      gapW8,
                      ElevatedButton(
                        onPressed: ()=> runYoutube(),
                        child: const Text("Run")
                        )
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
          loading: () => Center(child: Padding(
            padding: const EdgeInsets.all(100.0),
            child: Lottie.asset('assets/lottie/youtube_anim3_jump.json'),
          )),
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
            runYoutube();
          },
          tooltip: 'Copy link',
          child: const Icon(Icons.paste),
        ),
      ),
    );
  }
}