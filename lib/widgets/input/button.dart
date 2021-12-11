import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button({
    Key? key,
    required Function onPress,
    required String label,
  })  : _onPress = onPress,
        _label = label,
        super(key: key);

  final Function _onPress;
  final String _label;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _onPress(),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black54,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Text(_label),
        ),
      ),
    );
  }
}
