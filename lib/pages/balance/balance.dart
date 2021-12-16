import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hq/providers/theme_provider.dart';
import 'package:hq/widgets/cards/avatar.dart';
import 'package:hq/widgets/layout/header_options.dart';
import 'package:hq/widgets/layout/pop_screen.dart';

class Balance extends ConsumerStatefulWidget {
  const Balance({Key? key}) : super(key: key);
  static const String path = "/balance";

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _BalanceState();
}

class _BalanceState extends ConsumerState<Balance> {
  @override
  Widget build(BuildContext context) {
    final darkTheme = ref.watch(themeProvider);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: const [
                      PopScreen(),
                      Avatar(),
                    ],
                  ),
                  const HeaderOptions(),
                ],
              ),
              const SizedBox(
                height: 16.0,
              ),
              const Text(
                "Balance",
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1.25,
                ),
              ),
              Text(
                "Here you can exchange Flashes... \nfor real money",
                style: TextStyle(
                  color: darkTheme ? Colors.white54 : Colors.black54,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
