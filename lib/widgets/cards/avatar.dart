import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hq/providers/theme_provider.dart';

class Avatar extends ConsumerWidget {
  const Avatar({
    Key? key,
    onTap,
    double? radius,
  })  : _onTap = onTap,
        _radius = radius,
        super(key: key);

  final Function? _onTap;
  final double? _radius;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final darkTheme = ref.read(themeProvider);
    return GestureDetector(
      onTap: () {
        if (_onTap != null) _onTap!();
      },
      child: CircleAvatar(
        radius: _radius,
        backgroundColor: darkTheme ? Colors.black54 : Colors.white,
        backgroundImage: const NetworkImage(
          "https://64.media.tumblr.com/a22ac63e3dfe35a79d6120332b590ef9/tumblr_oticpms3uF1ui51sko1_1280.jpg",
        ),
      ),
    );
  }
}
