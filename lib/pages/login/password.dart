import 'package:flutter/material.dart';
import 'package:hq/widgets/input/custom_text_field.dart';

class LoginPassword extends StatefulWidget {
  const LoginPassword({
    Key? key,
    required controller,
    required Function back,
  })  : _controller = controller,
        _back = back,
        super(key: key);

  final TextEditingController _controller;
  final Function _back;

  @override
  State<LoginPassword> createState() => _LoginPasswordState();
}

class _LoginPasswordState extends State<LoginPassword> {
  bool _loading = false;

  void handleSubmit() async {
    setState(() {
      _loading = true;
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
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            MaterialButton(
              onPressed: () {
                if (!_loading) widget._back();
              },
              child: const Text("Back"),
            ),
            MaterialButton(
              onPressed: handleSubmit,
              child: Text(_loading ? "Loading..." : "Log in"),
            )
          ],
        ),
      ],
    );
  }
}
