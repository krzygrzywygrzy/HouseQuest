import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:hq/core/failure.dart';
import 'package:hq/pages/home/home.dart';
import 'package:hq/services/fetch_service.dart';
import 'package:hq/services/storage_service.dart';
import 'package:hq/widgets/input/button.dart';
import 'package:hq/widgets/input/custom_text_field.dart';

class LoginBoth extends StatefulWidget {
  const LoginBoth(
      {Key? key, required email, required password, message, required error})
      : _email = email,
        _password = password,
        _message = message,
        _error = error,
        super(key: key);

  final TextEditingController _email;
  final TextEditingController _password;
  final String? _message;
  final Function _error;

  @override
  State<LoginBoth> createState() => _LoginBothState();
}

class _LoginBothState extends State<LoginBoth> {
  bool _loading = false;

  void handleSubmit() async {
    setState(() {
      _loading = true;
    });

    var response = await FetchService.post("/login", {
      "login": widget._email.text,
      "password": widget._password.text,
    });

    response.fold((l) {
      String message = "";
      if (l is FetchFailure) {
        message = l.message ?? "";
      } else if (l is UnknownFailure) {
        message = "unknown error accured";
      }

      widget._error(message);
    }, (r) {
      var storage = StorageService();
      storage.save(jsonEncode(r));
      Navigator.pushNamed(context, Home.path);
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
