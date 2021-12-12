import 'package:flutter/material.dart';
import 'package:hq/widgets/input/button.dart';
import 'package:hq/widgets/input/custom_text_field.dart';

class LoginEmail extends StatelessWidget {
  const LoginEmail(
      {Key? key,
      required TextEditingController controller,
      required Function forward})
      : _controller = controller,
        _forward = forward,
        super(key: key);

  final TextEditingController _controller;
  final Function _forward;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextField(
          controller: _controller,
          hint: "email",
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Button(
              onPress: () => _forward(),
              label: "Next",
            )
          ],
        ),
      ],
    );
  }
}
