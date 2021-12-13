import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hq/core/custom_routes/hero_dialog_route.dart';
import 'package:hq/providers/home_provider.dart';
import 'package:hq/providers/theme_provider.dart';
import 'package:hq/widgets/cards/child_card.dart';
import 'package:hq/widgets/popups/add_child.dart';

class HomeMain extends ConsumerWidget {
  const HomeMain({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeData = ref.watch(homeProvider);
    final darkTheme = ref.watch(themeProvider);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Witaj",
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.white54,
                        ),
                      ),
                      Text(
                        homeData.user!.fname,
                        style: const TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              decoration: BoxDecoration(
                color: darkTheme ? Colors.black54 : Colors.green,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    Text(
                      homeData.user!.funds.toString(),
                      style: const TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    const Image(
                      image: AssetImage("assets/blys.png"),
                      height: 25,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        Padding(
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
              itemCount: homeData.user!.members.length + 1,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                if (index == homeData.user!.members.length) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context)
                            .push(HeroDialogRoute(builder: (context) {
                          return AddChildPopup();
                        }));
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Hero(
                            tag: "Add child",
                            child: CircleAvatar(
                              backgroundColor:
                                  darkTheme ? Colors.black54 : Colors.white,
                              child: const Icon(Icons.add),
                              radius: 30,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const Text("Add child"),
                        ],
                      ),
                    ),
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
        ),
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
      ],
    );
  }
}
