import 'package:flutter/material.dart';
import 'package:hq/pages/register/login.dart';
import 'package:hq/pages/register/personal.dart';

enum RegisterStates { personal, login }

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  static const String path = "/register";
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  RegisterStates state = RegisterStates.personal;

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _fnameController = TextEditingController();
  final _surnameController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _fnameController.dispose();
    _surnameController.dispose();
    super.dispose();
  }

  // ignore: unused_field
  String? _message;

  void _setError(String mess) {
    setState(() {
      _message = mess;
    });
  }

  Widget buildBody() {
    switch (state) {
      case RegisterStates.personal:
        return RegisterPersonal(
          fname: _fnameController,
          surname: _surnameController,
          forward: () {
            setState(() {
              state = RegisterStates.login;
            });
          },
        );
      case RegisterStates.login:
        return RegisterLogin(
            password: _passwordController,
            email: _emailController,
            fname: _fnameController,
            surname: _surnameController,
            back: () {
              setState(() {
                setState(() {
                  state = RegisterStates.personal;
                });
              });
            },
            error: _setError);
      default:
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
                    "Join HomeQuest",
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
