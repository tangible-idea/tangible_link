import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:tangible_link/riverpod/provider_logger.dart';
import 'package:tangible_link/routing/app_router.dart';
import 'package:tangible_link/styles/my_color.dart';


void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  // Fixed device orientation.
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  // * Initialize Firebase
  //await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await dotenv.load(fileName: "assets/dotenv");

  // * Init Supabase
  await Supabase.initialize(
      url: dotenv.get("SUPABASE_URL"),
      anonKey: dotenv.get("SUPABASE_KEY")
  );

  runApp(ProviderScope(
      observers: [
        ProviderLogger()
      ],
      child: const MyApp())
  );
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> with WidgetsBindingObserver {
  String? _lastClipboardText; // To store the last clipboard text

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this); // Add observer for app lifecycle changes
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this); // Remove observer when the widget is disposed
    super.dispose();
  }

  // This method is called whenever the app's lifecycle state changes
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      // App is in the foreground, check the clipboard for new YouTube links
      _checkClipboardForYouTubeLink();
    }
  }

  // Function to check the clipboard for YouTube links
  Future<void> _checkClipboardForYouTubeLink() async {
    ClipboardData? clipboardData = await Clipboard.getData('text/plain');
    final clipboardText = clipboardData?.text ?? '';

    // Check if the clipboard contains a new YouTube link
    if (clipboardText.isNotEmpty &&
        clipboardText != _lastClipboardText && // Ensure it's a new clipboard text
        isYouTubeLink(clipboardText)) {
      setState(() {
        _lastClipboardText = clipboardText; // Update the last clipboard text
      });

      // Navigate to YouTubeLinkScreen with the YouTube link
      ref.read(goRouterProvider).go('/youtube-link?link=$clipboardText');
    }
  }

  // Utility function to check if the text is a YouTube link
  bool isYouTubeLink(String text) {
    final youtubeRegex = RegExp(
      r'^(https?:\/\/)?(www\.)?(youtube\.com|youtu\.be)\/.+$',
      caseSensitive: false,
    );
    return youtubeRegex.hasMatch(text);
  }

  @override
  Widget build(BuildContext context) {
    final goRouter = ref.watch(goRouterProvider);

    return MaterialApp.router(
      routerConfig: goRouter,
      title: 'AI Sum',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: MyColor.kPrimary),
        useMaterial3: true,
      ),
    );
  }
}