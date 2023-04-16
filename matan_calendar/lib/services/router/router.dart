import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../main.dart';
import '../../view/screens/add_screen.dart';
import '../../view/screens/calendar_screen.dart';
import '../../view/screens/home_screen.dart';

final GlobalKey<NavigatorState> rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> shellNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'shell');

final routerProvider = Provider<GoRouter>(
  (ref) {
    int new_index = 0;
    Widget new_childBody = const HomeScreen();
    return GoRouter(
      initialLocation: '/',
      observers: [BotToastNavigatorObserver()],
      routes: [
        GoRoute(
          path: '/',
          pageBuilder: (context, state) {
            // if there is extra param change the index
            if (state.extra != null) {
              new_index = state.extra! as int;
              switch (new_index) {
                case 0:
                  new_childBody = const HomeScreen();
                  break;
                case 1:
                  new_childBody = const AddScreen();
                  break;
                case 2:
                  new_childBody = const CalendarScreen();
                  break;
              }
            }
            return MaterialPage<void>(
              child: MyHomePage(
                index: new_index,
                childBody: new_childBody,
              ),
            );
          },
        ),
      ],
    );
  },
);

extension on Route<dynamic> {
  String get name => settings.name ?? '';
}
