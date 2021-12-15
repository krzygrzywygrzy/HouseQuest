import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hq/providers/theme_provider.dart';

class HeaderOptions extends ConsumerWidget {
  const HeaderOptions({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final darkTheme = ref.watch(themeProvider);
    return Row(
      children: [
        GestureDetector(),
        GestureDetector(
          child: const Icon(Ionicons.md_reorder),
        )
      ],
    );
  }
}
