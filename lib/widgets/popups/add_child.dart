import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hq/widgets/input/button.dart';
import 'package:hq/widgets/input/custom_text_field.dart';

// ignore: must_be_immutable
class AddChildPopup extends StatelessWidget {
  AddChildPopup({Key? key}) : super(key: key);

  final _fnameController = TextEditingController();
  final _surnameController = TextEditingController();
  final _loginController = TextEditingController();
  final _passwordController = TextEditingController();

  String? message;

  Future<void> submit() async {}

  Widget? showMessage() {
    if (message != null) {
      return Center(
        child: Text(
          message ?? "",
          textAlign: TextAlign.center,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Hero(
        tag: "Add child",
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: SingleChildScrollView(
            child: Material(
              elevation: 2,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Center(
                      child: Text(
                        "Add child",
                        style: TextStyle(fontSize: 22),
                      ),
                    ),
                    CustomTextField(
                      controller: _fnameController,
                      hint: "Name",
                    ),
                    CustomTextField(
                      controller: _surnameController,
                      hint: "Surname",
                    ),
                    CustomTextField(
                      controller: _loginController,
                      hint: "Login",
                    ),
                    CustomTextField(
                      controller: _passwordController,
                      hint: "Password",
                      obscureText: true,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Button(onPress: submit, label: "Add child"),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    showMessage() ?? Container(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
