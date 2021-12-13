import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hq/core/failure.dart';
import 'package:hq/pages/home/home.dart';
import 'package:hq/services/fetch_service.dart';
import 'package:hq/services/storage_service.dart';
import 'package:hq/widgets/input/button.dart';
import 'package:hq/widgets/input/custom_text_field.dart';

class LoginPassword extends StatefulWidget {
  const LoginPassword({
    Key? key,
    required controller,
    required Function back,
    required email,
    required Function error,
  })  : _controller = controller,
        _back = back,
        _email = email,
        _error = error,
        super(key: key);

  final TextEditingController _controller;
  final TextEditingController _email;

  final Function _back;
  final Function _error;

  @override
  State<LoginPassword> createState() => _LoginPasswordState();
}

class _LoginPasswordState extends State<LoginPassword> {
  bool _loading = false;

  void handleSubmit() async {
    setState(() {
      _loading = true;
    });

    var response = await FetchService.post("/login", {
      "login": widget._email.text,
      "password": widget._controller.text,
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
          controller: widget._controller,
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
              label: _loading ? "Loading..." : "Log in",
            )
          ],
        ),
      ],
    );
  }
}
