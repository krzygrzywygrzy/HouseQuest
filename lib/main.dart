import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hq/pages/account/account.dart';
import 'package:hq/pages/balance/balance.dart';
import 'package:hq/pages/home/home.dart';
import 'package:hq/pages/login/login.dart';
import 'package:hq/pages/register/register.dart';
import 'package:hq/pages/splash_screen.dart';
import 'package:hq/pages/welcome/welcome.dart';
import 'package:hq/providers/theme_provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");

  await Supabase.initialize(
    anonKey: dotenv.env["ANON"],
    url: dotenv.env["URL"],
  );

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
        initialRoute: SplashPage.path,
        routes: {
          SplashPage.path: (context) => const SplashPage(),
          Welcome.path: (context) => const Welcome(),
          Home.path: (context) => const Home(),
          Login.path: (context) => const Login(),
          Register.path: (context) => const Register(),
          Account.path: (context) => const Account(),
          Balance.path: (context) => const Balance(),
        },
      );
    });
  }
}
