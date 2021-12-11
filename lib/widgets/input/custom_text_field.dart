import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hq/providers/theme_provider.dart';

class CustomTextField extends ConsumerWidget {
  const CustomTextField({
    Key? key,
    required TextEditingController controller,
    bool? obscureText,
    String? hint,
  })  : _controller = controller,
        _obscureText = obscureText,
        _hint = hint,
        super(key: key);

  final TextEditingController _controller;
  final bool? _obscureText;
  final String? _hint;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Consumer(
      builder: (context, ref, _) {
        final _darkTheme = ref.watch(themeProvider);

        return TextField(
          controller: _controller,
          obscureText: _obscureText ?? false,
          cursorColor: _darkTheme ? Colors.white : Colors.black,
          decoration: InputDecoration(
            hintText: _hint,
            enabledBorder: UnderlineInputBorder(
              borderSide:
                  BorderSide(color: _darkTheme ? Colors.white : Colors.black),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: _darkTheme ? Colors.white : Colors.black,
                width: 3,
              ),
            ),
          ),
        );
      },
    );
  }
}
