import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hq/pages/add/add_child.dart';
import 'package:hq/providers/home_provider.dart';
import 'package:hq/widgets/cards/child_card.dart';
import 'package:hq/widgets/input/add_button.dart';

class HomeUsers extends ConsumerWidget {
  const HomeUsers({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeData = ref.watch(homeProvider);
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          minHeight: 35.0,
          maxHeight: 110.0,
        ),
        child: ListView.builder(
          itemCount: homeData.user!.isAdult
              ? homeData.user!.members.length + 1
              : homeData.user!.members.length,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            if (index == homeData.user!.members.length) {
              return AddButton(
                label: "Add Child",
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AddChild()));
                },
                tag: "Add child",
              );
            } else {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ChildCard(name: homeData.user!.members[index].fname),
              );
            }
          },
        ),
      ),
    );
  }
}
