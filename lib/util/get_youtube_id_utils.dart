String? getYoutubeId(String url) {
  final RegExp regExp = RegExp(
    r"(?:(?:https?:\/\/)?(?:www\.)?(?:youtube\.com\/(?:[^\/\n\s]+\/\S+\/|(?:v|e(?:mbed)?)\/|.*[?&]v=)|youtu\.be\/))([a-zA-Z0-9_-]{11})",
    caseSensitive: false,
  );

  final match = regExp.firstMatch(url);
  return match?.group(1);
}
