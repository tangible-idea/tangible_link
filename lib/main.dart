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

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final goRouter = ref.watch(goRouterProvider);

    return MaterialApp.router(
      routerConfig: goRouter,
      title: 'Prayers',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: MyColor.kPrimary),
        useMaterial3: true,
      ),
    );
  }
}

