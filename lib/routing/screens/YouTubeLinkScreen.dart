import 'package:flutter/material.dart';

class YouTubeLinkScreen extends StatelessWidget {
  final String link;

  const YouTubeLinkScreen({super.key, required this.link});

  @override
  Widget build(BuildContext context) {
    print(link);

    return Scaffold(
      appBar: AppBar(
        title: const Text('YouTube Link'),
      ),
      body: Center(
        child: link.isNotEmpty
            ? Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Received YouTube Link:'),
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
            : const Text('No link shared.'),
      ),
    );
  }
}