import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hq/pages/welcome/welcome.dart';
import 'package:hq/providers/theme_provider.dart';
import 'package:hq/widgets/input/button.dart';

class HomeAccount extends ConsumerWidget {
  const HomeAccount({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            children: [
              Button(
                onPress: () {
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      Welcome.path, (Route<dynamic> route) => false);
                },
                label: "log out",
              ),
              const SizedBox(
                width: 10,
              ),
              Button(
                onPress: () {
                  ref.read(themeProvider.notifier).toogle();
                },
                label: "toggle theme",
              ),
            ],
          )
        ],
      ),
    );
  }
}
