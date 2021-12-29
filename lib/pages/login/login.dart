import 'package:flutter/material.dart';
import 'package:hq/pages/login/both.dart';
import 'package:hq/pages/login/email.dart';
import 'package:hq/pages/login/password.dart';

enum LoginStates { email, password, both }

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);
  static const String path = "/login";

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  LoginStates state = LoginStates.email;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  String? _message;

  void _setError(String mess) {
    setState(() {
      _message = mess;
      state = LoginStates.both;
    });
  }

  Widget buildBody() {
    switch (state) {
      case LoginStates.email:
        return LoginEmail(
          controller: _emailController,
          forward: () {
            setState(() {
              state = LoginStates.password;
            });
          },
        );
      case LoginStates.password:
        return LoginPassword(
          controller: _passwordController,
          email: _emailController,
          back: () {
            setState(() {
              state = LoginStates.email;
            });
          },
          error: _setError,
        );
      case LoginStates.both:
        return LoginBoth(
          email: _emailController,
          password: _passwordController,
          message: _message,
          error: _setError,
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Stack(
            children: [
              Positioned(
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(Icons.arrow_back_ios),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    "Log in into HomeQuest",
                    textAlign: TextAlign.center,
                  ),
                  buildBody(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
