import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hq/pages/home/home_header.dart';
import 'package:hq/pages/home/home_users.dart';
import 'package:hq/providers/home_provider.dart';
import 'package:hq/widgets/cards/avatar.dart';
import 'package:hq/widgets/cards/quest_card.dart';
import 'package:hq/widgets/layout/header_options.dart';

class HomeMain extends ConsumerWidget {
  const HomeMain({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeData = ref.watch(homeProvider);
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
        const SizedBox(),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            "Recent Activities",
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: SizedBox(
            height: 120,
            child: ListView.builder(
              itemCount: homeData.user!.quests.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: index == 0
                      ? const EdgeInsets.symmetric(horizontal: 16)
                      : const EdgeInsets.only(right: 16),
                  child: QuestCard(
                    quest: homeData.user!.quests[index],
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
