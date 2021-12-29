import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hq/pages/account/account.dart';
import 'package:hq/pages/balance/balance.dart';
import 'package:hq/pages/home/home.dart';
import 'package:hq/pages/login/login.dart';
import 'package:hq/pages/register/register.dart';
import 'package:hq/pages/welcome/welcome.dart';
import 'package:hq/providers/theme_provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    anonKey:
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiYW5vbiIsImlhdCI6MTY0MDc4ODg4NywiZXhwIjoxOTU2MzY0ODg3fQ.K3_o7HBs9jim3F8Kju0vZ7Of4R0PA_ksqqCQM4j-TWI",
    url: "https://tmogjipowfyeyfvesqvf.supabase.co",
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
        initialRoute: Welcome.path,
        routes: {
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
