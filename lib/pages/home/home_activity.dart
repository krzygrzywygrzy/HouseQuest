import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hq/pages/add/add_activity.dart';
import 'package:hq/pages/add/add_quest.dart';
import 'package:hq/providers/home_provider.dart';
import 'package:hq/widgets/cards/quest_card.dart';
import 'package:hq/widgets/input/button.dart';

class HomeActicivity extends ConsumerWidget {
  const HomeActicivity({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeData = ref.watch(homeProvider);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 8,
          ),
          child: Row(
            children: [
              Button(
                  onPress: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AddQuest(),
                        ),
                      ),
                  label: "Add Quest 💪"),
              const SizedBox(
                width: 8,
              ),
              Button(
                  onPress: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AddActivity(),
                        ),
                      ),
                  label: "Add Activity 📝"),
            ],
          ),
        ),
        const SizedBox(
          height: 8,
        ),
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
            height: 160,
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
