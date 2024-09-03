import 'package:bloc_clean_tdd_demo/features/history/presentation/pages/history_screen.dart';
import 'package:bloc_clean_tdd_demo/features/number_trivia/presentation/pages/home_screen.dart';
import 'package:bloc_clean_tdd_demo/features/tabs/presentation/pages/tab_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

enum AppRoute {
  splashScreen,

  /// TRIVIA ///
  homeScreen,

  /// HISTORY ///
  historyScreen,
}

extension PathName on AppRoute {
  String get path =>
      switch (this) { AppRoute.homeScreen => "/", _ => "/$name" };
}

class AppNavigator {
  AppNavigator._();

  static final _rootNavigator = GlobalKey<NavigatorState>();

  static GlobalKey<NavigatorState> get rootNavigator => _rootNavigator;

  static final _shellNavigatorTrivia =
      GlobalKey<NavigatorState>(debugLabel: "TRIVIA NAVIGATOR");
  static final _shellNavigatorHistory =
      GlobalKey<NavigatorState>(debugLabel: "HISTORY NAVIGATOR");

  static final router = GoRouter(
    // initialLocation: AppRoute.login.path,
    initialLocation: AppRoute.homeScreen.path,
    debugLogDiagnostics: true,
    navigatorKey: rootNavigator,
    routes: [
      // GoRoute(
      //   path: AppRoute.splashScreen.path,
      //   name: AppRoute.splashScreen.name,
      //   builder: (context, state) => SplashScreen(key: state.pageKey),
      // ),
      StatefulShellRoute.indexedStack(
        // parentNavigatorKey: _rootNavigator,
        builder: (context, state, navigationShell) {
          return TabScreen(
            key: state.pageKey,
            navigationShell: navigationShell,
          );
        },
        branches: <StatefulShellBranch>[
          /// TRIVIA BRANCH
          StatefulShellBranch(
            navigatorKey: _shellNavigatorTrivia,
            routes: <RouteBase>[
              GoRoute(
                path: AppRoute.homeScreen.path,
                name: AppRoute.homeScreen.name,
                builder: (BuildContext context, GoRouterState state) =>
                    const HomeScreen(),
              ),
            ],
          ),

          /// HISTORY BRANCH
          StatefulShellBranch(
            navigatorKey: _shellNavigatorHistory,
            routes: <RouteBase>[
              GoRoute(
                path: AppRoute.historyScreen.path,
                name: AppRoute.historyScreen.name,
                builder: (BuildContext context, GoRouterState state) =>
                    const HistoryScreen(),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
