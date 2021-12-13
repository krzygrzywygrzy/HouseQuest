import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hq/core/custom_routes/hero_dialog_route.dart';
import 'package:hq/widgets/input/add_button.dart';
import 'package:hq/widgets/popups/add_quest.dart';

class HomeQuests extends ConsumerWidget {
  const HomeQuests({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          AddButton(
              label: "Add Quest",
              onTap: () {
                Navigator.of(context).push(HeroDialogRoute(builder: (context) {
                  return const AddQuestPopup();
                }));
              },
              tag: "Add quest"),
        ],
      ),
    );
  }
}
