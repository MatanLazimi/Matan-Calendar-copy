import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../main.dart';
import '../view/screens/home_screen.dart';

final GlobalKey<NavigatorState> rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> shellNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'shell');

final routerProvider = Provider<GoRouter>(
  (ref) {
    return GoRouter(
      initialLocation: '/',
      routes: [
        GoRoute(
          path: '/',
          pageBuilder: (context, state) => MaterialPage<void>(
            child: MyHomePage(
              index: 0,
              childBody: const HomeScreen(),
            ),
          ),
        ),
        // ShellRoute(
        //   builder: (BuildContext context, GoRouterState state, Widget child) {
        //     // check location name and get the tab index
        //     var index = 0;
        //     switch (state.location) {
        //       case '/home':
        //         index = 0;
        //         break;
        //       case '/calendar':
        //         index = 1;
        //         break;
        //       case '/add':
        //         index = 2;
        //         break;
        //     }

        //     return MyHomePage(
        //       index: index,
        //       childBody: child,
        //     );
        //   },
        // ),
      ],
    );
  },
);

extension on Route<dynamic> {
  String get name => settings.name ?? '';
}
