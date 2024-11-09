import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:go_router/go_router.dart';
import 'not_found_screen.dart';

part 'app_router.g.dart';

// private navigators
final _rootNavigatorKey = GlobalKey<NavigatorState>();

enum AppRoute {
  onboarding,
  signIn,
  home,
  profile,
  personality,
}

@riverpod
GoRouter goRouter(GoRouterRef ref) {

  return GoRouter(
    initialLocation: '/home/413839384959459',
    redirect: (context, state) async {
      return null;
    },
    // refresh 시점: 어떤 state가 변경될때 refresh 시도할 것인지?
    //refreshListenable: GoRouterRefreshStream(authRepository.authStateChanges()),
    routes: [
    ],
    errorPageBuilder: (context, state) => const NoTransitionPage(
      child: NotFoundScreen(),
    ),
  );
}
