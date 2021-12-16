import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hq/widgets/layout/header_options.dart';
import 'package:hq/widgets/layout/pop_screen.dart';

class Account extends ConsumerStatefulWidget {
  const Account({Key? key}) : super(key: key);
  static const path = "/account";

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AccountState();
}

class _AccountState extends ConsumerState<Account> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                PopScreen(),
                HeaderOptions(),
              ],
            ),
          ],
        ),
      )),
    );
  }
}
