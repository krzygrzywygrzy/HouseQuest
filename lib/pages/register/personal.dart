import 'package:flutter/material.dart';
import 'package:hq/widgets/input/button.dart';
import 'package:hq/widgets/input/custom_text_field.dart';

class RegisterPersonal extends StatelessWidget {
  const RegisterPersonal({Key? key, required fname, surname, forward})
      : _fname = fname,
        _surname = surname,
        _forward = forward,
        super(key: key);

  final TextEditingController _fname;
  final TextEditingController _surname;
  final Function _forward;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextField(
          controller: _fname,
          hint: "name",
        ),
        CustomTextField(
          controller: _surname,
          hint: "surname",
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
