import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hq/pages/home/home_activity.dart';
import 'package:hq/pages/home/home_header.dart';
import 'package:hq/pages/home/home_users.dart';
import 'package:hq/widgets/cards/avatar.dart';
import 'package:hq/widgets/layout/header_options.dart';

class HomeMain extends ConsumerWidget {
  const HomeMain({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Avatar(),
              HeaderOptions(),
            ],
          ),
        ),
        const HomeHeader(),
        const HomeUsers(),
        const HomeActicivity(),
      ],
    );
  }
}
