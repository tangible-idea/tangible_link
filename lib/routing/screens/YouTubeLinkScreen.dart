import 'package:flutter/material.dart';

class YouTubeLinkScreen extends StatelessWidget {
  final String link;

  const YouTubeLinkScreen({Key? key, required this.link}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('YouTube Link'),
      ),
      body: Center(
        child: link.isNotEmpty
            ? Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Detected YouTube Link:'),
            const SizedBox(height: 10),
            SelectableText(
              link,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.blue,
                decoration: TextDecoration.underline,
              ),
            ),
          ],
        )
            : const Text('No YouTube link detected.'),
      ),
    );
  }
}