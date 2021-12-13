import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hq/providers/theme_provider.dart';

class CustomTextField extends ConsumerWidget {
  const CustomTextField({
    Key? key,
    required TextEditingController controller,
    bool? obscureText,
    String? hint,
    TextInputType? keyboardType,
  })  : _controller = controller,
        _obscureText = obscureText,
        _hint = hint,
        _keyboardType = keyboardType,
        super(key: key);

  final TextEditingController _controller;
  final bool? _obscureText;
  final String? _hint;
  final TextInputType? _keyboardType;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Consumer(
      builder: (context, ref, _) {
        final _darkTheme = ref.watch(themeProvider);

        return TextField(
          controller: _controller,
          obscureText: _obscureText ?? false,
          cursorColor: _darkTheme ? Colors.white : Colors.black,
          keyboardType: _keyboardType ?? TextInputType.text,
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
