import 'package:bot_toast/bot_toast.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'router/router.dart';
import 'view/screens/add_screen.dart';
import 'view/screens/calendar_screen.dart';
import 'view/screens/home_screen.dart';
import 'view/style/theme.dart';

Future<void> main() async {
  // ensure initialized
  WidgetsFlutterBinding.ensureInitialized();

  // init firebase
  await Firebase.initializeApp();

  // run app
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  late GoRouter router;

  @override
  void initState() {
    router = ref.read(routerProvider);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationParser: router.routeInformationParser,
      routerDelegate: router.routerDelegate,
      routeInformationProvider: router.routeInformationProvider,
      title: 'Matan Calendar',
      theme: AppTheme().Theme,
      builder: BotToastInit(),
    );
  }
}

class MyHomePage extends ConsumerStatefulWidget {
  MyHomePage({super.key, this.index = 0, this.childBody = const HomeScreen()});
  int index;
  Widget childBody;

  @override
  ConsumerState<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends ConsumerState<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Matan Calendar Home Page'),
      ),
      body: widget.childBody,
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Calendar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Add',
          ),
        ],
        currentIndex: widget.index,
        selectedItemColor: Colors.amber[800],
        onTap: (int index) {
          if (index == 0) {
            setState(() {
              widget.index = 0;
              widget.childBody = const HomeScreen();
            });
          } else if (index == 1) {
            setState(() {
              widget.index = 1;
              widget.childBody = const CalendarScreen();
            });
          } else if (index == 2) {
            setState(() {
              widget.index = 2;
              widget.childBody = const AddScreen();
            });
          }
        },
      ),
    );
  }
}
