import 'package:flutter/material.dart';
import 'package:hq/widgets/input/button.dart';
import 'package:hq/widgets/input/custom_text_field.dart';

class LoginBoth extends StatefulWidget {
  const LoginBoth({Key? key, required email, required password, message})
      : _email = email,
        _password = password,
        _message = message,
        super(key: key);

  final TextEditingController _email;
  final TextEditingController _password;
  final String? _message;

  @override
  State<LoginBoth> createState() => _LoginBothState();
}

class _LoginBothState extends State<LoginBoth> {
  bool _loading = false;

  void handleSubmit() async {
    setState(() {
      _loading = true;
    });

    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextField(
          controller: widget._email,
          hint: "email",
        ),
        CustomTextField(
          controller: widget._password,
          hint: "password",
          obscureText: true,
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Button(
              onPress: handleSubmit,
              label: _loading ? "Loading..." : "Log in",
            )
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Text(widget._message ?? ""),
      ],
    );
  }
}
