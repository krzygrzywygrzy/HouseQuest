import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hq/pages/account/account.dart';
import 'package:hq/providers/theme_provider.dart';

class HeaderOptions extends ConsumerWidget {
  const HeaderOptions({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final darkTheme = ref.watch(themeProvider);
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            ref.read(themeProvider.notifier).toogle();
          },
          child: Icon(
            !darkTheme ? Icons.nightlight : Icons.wb_sunny_rounded,
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        ModalRoute.of(context)?.settings.name == Account.path
            ? Container()
            : GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, Account.path);
                },
                child: const Icon(Icons.menu),
              )
      ],
    );
  }
}
