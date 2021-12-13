import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:hq/core/failure.dart';
import 'package:hq/pages/home/home.dart';
import 'package:hq/services/fetch_service.dart';
import 'package:hq/services/storage_service.dart';
import 'package:hq/widgets/input/button.dart';
import 'package:hq/widgets/input/custom_text_field.dart';

class RegisterLogin extends StatefulWidget {
  const RegisterLogin({
    Key? key,
    required password,
    required email,
    required fname,
    required surname,
    required back,
    required error,
    message,
  })  : _password = password,
        _email = email,
        _fname = fname,
        _surname = surname,
        _back = back,
        _error = error,
        _message = message,
        super(key: key);

  final TextEditingController _password;
  final TextEditingController _email;

  final TextEditingController _fname;
  final TextEditingController _surname;

  final Function _back;
  final Function _error;
  final String? _message;

  @override
  _RegisterLoginState createState() => _RegisterLoginState();
}

class _RegisterLoginState extends State<RegisterLogin> {
  bool _loading = false;

  void handleSubmit() async {
    setState(() {
      _loading = true;
    });

    FetchService fetch = FetchService();
    var response = await fetch.post("/signup", {
      "login": widget._email.text,
      "password": widget._password.text,
      "fname": widget._fname.text,
      "surname": widget._surname.text,
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
      StorageService storage = StorageService();
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
          hint: "login",
        ),
        CustomTextField(
          controller: widget._password,
          hint: "password",
          obscureText: true,
        ),
        const SizedBox(
          height: 5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            MaterialButton(
              onPressed: () {
                if (!_loading) widget._back();
              },
              child: const Text("Back"),
            ),
            const SizedBox(
              width: 10,
            ),
            Button(
              onPress: handleSubmit,
              label: _loading ? "Loading..." : "Join",
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
