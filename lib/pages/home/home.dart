import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hq/pages/home/home_account.dart';
import 'package:hq/pages/home/home_main.dart';
import 'package:hq/pages/home/home_quests.dart';
import 'package:hq/providers/home_provider.dart';

class Home extends ConsumerStatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeState();
  static String path = "/home";
}

class _HomeState extends ConsumerState<Home> {
  @override
  void initState() {
    super.initState();
    ref.read(homeProvider.notifier).load();
  }

  int _currentSubScreen = 0;

  Widget buildSubpages() {
    switch (_currentSubScreen) {
      case 0:
        return const HomeMain();
      case 1:
        return const HomeQuests();
      case 2:
        return const HomeAccount();
      default:
        return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    final homeData = ref.watch(homeProvider);
    if (homeData.user != null) {
      return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          onTap: (int index) {
            setState(() {
              _currentSubScreen = index;
            });
          },
          currentIndex: _currentSubScreen,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.task),
              label: "Quests",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              label: "Account",
            ),
          ],
        ),
        body: SafeArea(
          child: buildSubpages(),
        ),
      );
    } else
      // ignore: curly_braces_in_flow_control_structures
      return const Scaffold(
        body: Center(
          child: Text("loading..."),
        ),
      );
  }
}
