import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hq/pages/home/home.dart';
import 'package:hq/pages/login/login.dart';
import 'package:hq/pages/welcome/welcome.dart';
import 'package:hq/providers/theme_provider.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Consumer(builder: (context, ref, _) {
      final _darkTheme = ref.watch(themeProvider);
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'HomeQuest',
        theme: ThemeData(
          fontFamily: "Montserrat",
        ),
        darkTheme: ThemeData(
          brightness: Brightness.dark,
          fontFamily: "Montserrat",
        ),
        themeMode: _darkTheme ? ThemeMode.dark : ThemeMode.light,
        initialRoute: Welcome.path,
        routes: {
          Welcome.path: (context) => const Welcome(),
          Home.path: (context) => const Home(),
          Login.path: (context) => const Login(),
        },
      );
    });
  }
}
