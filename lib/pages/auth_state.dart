import 'package:flutter/material.dart';
import 'package:hq/pages/home/home.dart';
import 'package:hq/pages/welcome/welcome.dart';
import 'package:supabase/supabase.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthState<T extends StatefulWidget> extends SupabaseAuthState<T> {
  @override
  void onAuthenticated(Session session) {
    if (mounted) {
      Navigator.of(context)
          .pushNamedAndRemoveUntil(Home.path, (route) => false);
    }
  }

  @override
  void onErrorAuthenticating(String message) {
    print(message);
  }

  @override
  void onPasswordRecovery(Session session) {}

  @override
  void onUnauthenticated() {
    Navigator.of(context)
        .pushNamedAndRemoveUntil(Welcome.path, (route) => false);
  }
}
