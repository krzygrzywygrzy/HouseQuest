import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:hq/providers/theme_provider.dart';

class SelectiveButton extends ConsumerWidget {
  const SelectiveButton({Key? key, selected, required caption, onTap})
      : _selected = selected,
        _caption = caption,
        _onTap = onTap,
        super(key: key);

  final bool? _selected;
  final String _caption;
  final Function? _onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //final darkTheme = ref.watch(themeProvider);
    return GestureDetector(
      onTap: () {
        if (_onTap != null) _onTap!();
      },
      child: Material(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: _selected == true ? 2 : 0,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(_caption),
        ),
      ),
    );
  }
}
