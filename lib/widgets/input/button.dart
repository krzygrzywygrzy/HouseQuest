import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hq/providers/theme_provider.dart';

class Button extends ConsumerWidget {
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
  Widget build(BuildContext context, WidgetRef ref) {
    return Consumer(builder: (context, ref, _) {
      final _darkTheme = ref.watch(themeProvider);
      return GestureDetector(
        onTap: () => _onPress(),
        child: Material(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Container(
            decoration: BoxDecoration(
              color: _darkTheme ? Colors.black54 : Colors.white,
              borderRadius: BorderRadius.circular(10),
              border:
                  _darkTheme ? null : Border.all(color: Colors.black, width: 2),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Text(
                _label,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      );
    });
  }
}
