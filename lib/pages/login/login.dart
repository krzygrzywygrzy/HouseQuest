import 'package:flutter/material.dart';
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
          back: () {
            setState(() {
              state = LoginStates.email;
            });
          },
        );
      case LoginStates.both:
        return Container();
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
