import 'package:flutter/material.dart';
import 'package:hq/pages/auth_state.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);
  static const String path = "/splash";

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends AuthState<SplashPage> {
  @override
  void initState() {
    recoverSupabaseSession();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
