import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tangible_link/routing/screens/HomeScreen.dart';
import 'package:tangible_link/routing/screens/LoginScreen.dart';
import 'package:tangible_link/routing/screens/RegisterScreen.dart';
import 'package:tangible_link/routing/screens/YouTubeLinkScreen.dart';
import 'not_found_screen.dart';
part 'app_router.g.dart';

// private navigators
final _rootNavigatorKey = GlobalKey<NavigatorState>();

enum AppRoute {
  onboarding,
  login,
  home,
  youtubeLink,
}

@riverpod
GoRouter goRouter(GoRouterRef ref) {
  return GoRouter(
    initialLocation: '/login',
    routes: [
      // Login Route
      GoRoute(
        path: '/login',
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: '/register',
        builder: (context, state) => const RegisterScreen(),
      ),
      GoRoute(
        path: '/home',
        builder: (context, state) => HomeScreen(),
      ),
      GoRoute(
        path: '/youtube-link',
        builder: (context, state) {
          final link = state.uri.queryParameters['link'] ?? '';
          return YouTubeLinkScreen(link: link);
        },
      ),
    ],
    errorPageBuilder: (context, state) => const NoTransitionPage(
      child: NotFoundScreen(),
    ),
  );
}