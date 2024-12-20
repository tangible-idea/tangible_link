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

class YouTubeLinkScreen extends ConsumerStatefulWidget {
  const YouTubeLinkScreen({super.key});

  @override
  _YouTubeLinkScreenState createState() => _YouTubeLinkScreenState();
}

class _YouTubeLinkScreenState extends ConsumerState<YouTubeLinkScreen> {
  final TextEditingController _linkController = TextEditingController();
  String _currentLink = '';

  @override
  void initState() {
    super.initState();
    _populateFromClipboard();
  }

  Future<void> _populateFromClipboard() async {
    final clipboardLink = await ClipboardUtils.getYouTubeLinkFromClipboard();
    if (clipboardLink != null) {
      setState(() {
        _linkController.text = clipboardLink;
        _currentLink = clipboardLink;
      });
    }
  }

  void _searchLink() {
    final enteredLink = _linkController.text.trim();
    if (enteredLink.isNotEmpty && _validateYouTubeLink(enteredLink)) {
      setState(() {
        _currentLink = enteredLink;
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a valid YouTube link')),
      );
    }
  }

  bool _validateYouTubeLink(String link) {
    final youtubeRegex = RegExp(
      r'^(https?\:\/\/)?(www\.youtube\.com|youtu\.?be)\/.+$',
    );
    return youtubeRegex.hasMatch(link);
  }

  @override
  void dispose() {
    _linkController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final summaryAsyncValue = _currentLink.isNotEmpty
        ? ref.watch(youtubeSummaryProvider(_currentLink))
        : null;

    return SafeArea(
      child: Scaffold(
        appBar: ProfileHeader(
          iconData: Icons.history,
          onIconTap: () {
            ref.read(goRouterProvider).go('/home'); // Navigate to home
          },
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Input Field and Search Button
              Row(
                children: [
                  // Expanded to make the TextField take up available space
                  Expanded(
                    child: TextField(
                      controller: _linkController,
                      decoration: const InputDecoration(
                        labelText: 'YouTube Link',
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.url,
                      onSubmitted: (value) => _searchLink(),
                    ),
                  ),
                  const SizedBox(width: 8),
                  IconButton(
                    icon: const Icon(Icons.search, color: Colors.blue),
                    onPressed: _searchLink,
                    tooltip: 'Search',
                  ),
                ],
              ),
              const SizedBox(height: 16),
              // Display Summary or Loading/Error based on the state
              Expanded(
                child: summaryAsyncValue?.when(
                  data: (summary) {
                    return Column(
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
                              _currentLink,
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
                          child: MarkdownPage(summary),
                        ),
                      ],
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
                ) ??
                    Center(
                      child: Text(
                        'Enter a YouTube link to get its summary.',
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                    ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            final clipboardLink = await ClipboardUtils.getYouTubeLinkFromClipboard();
            if (clipboardLink != null && _validateYouTubeLink(clipboardLink)) {
              setState(() {
                _linkController.text = clipboardLink;
                _currentLink = clipboardLink;
              });
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('No valid YouTube link in clipboard')),
              );
            }
          },
          child: const Icon(Icons.paste),
          tooltip: 'Paste from Clipboard',
        ),
      ),
    );
  }
}