import 'package:flutter/services.dart';

class ClipboardUtils {
  static Future<String?> getYouTubeLinkFromClipboard() async {
    ClipboardData? clipboardData = await Clipboard.getData('text/plain');
    final clipboardText = clipboardData?.text ?? '';

    if (clipboardText.isNotEmpty && isYouTubeLink(clipboardText)) {
      return clipboardText;
    }
    return null;
  }

  static bool isYouTubeLink(String text) {
    return text.startsWith("https://www.youtube.com/") ||
        text.startsWith("https://youtube.com/") ||
        text.startsWith("https://youtu.be/");
  }
}