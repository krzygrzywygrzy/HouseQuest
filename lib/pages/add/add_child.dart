import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hq/providers/theme_provider.dart';
import 'package:hq/widgets/input/button.dart';
import 'package:hq/widgets/input/custom_text_field.dart';
import 'package:hq/widgets/layout/selective_button.dart';

class AddChild extends ConsumerStatefulWidget {
  const AddChild({Key? key}) : super(key: key);
  static const String path = "/add_child";

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AddChildState();
}

class _AddChildState extends ConsumerState<AddChild> {
  final _fnameController = TextEditingController();
  final _loginController = TextEditingController();
  final _passwordController = TextEditingController();

  bool isMale = true;

  Future<void> handleSubmit() async {}

  @override
  Widget build(BuildContext context) {
    final darkTheme = ref.watch(themeProvider);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
          ),
          child: ConstrainedBox(
            constraints: BoxConstraints(
                minHeight: MediaQuery.of(context).size.height - 32),
            child: Stack(
              children: [
                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            "Add child 👶",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 25,
                            ),
                          ),
                          GestureDetector(
                            onTap: () => Navigator.pop(context),
                            child: const Icon(Icons.close),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Text(
                        "Add child to your family...\nto give them quests\nand plan their time",
                        style: TextStyle(
                          color: darkTheme ? Colors.white54 : Colors.black54,
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      CustomTextField(
                        controller: _fnameController,
                        hint: "name",
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 8,
                        ),
                        child: Row(
                          children: [
                            SelectiveButton(
                              caption: "boy 👦",
                              selected: isMale == true,
                              onTap: () {
                                setState(() {
                                  isMale = true;
                                });
                              },
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            SelectiveButton(
                              caption: "girl 👧",
                              selected: isMale == false,
                              onTap: () {
                                setState(() {
                                  isMale = false;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      const Text(
                        "Login data",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        "Information that your children will use\nto login to application",
                        style: TextStyle(
                          color: darkTheme ? Colors.white54 : Colors.black54,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTextField(
                        controller: _loginController,
                        hint: "login",
                      ),
                      CustomTextField(
                        controller: _passwordController,
                        hint: "password",
                        obscureText: true,
                      ),
                      const SizedBox(
                        height: 64,
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 16,
                  left: 0,
                  right: 0,
                  child: Button(
                    onPress: handleSubmit,
                    label: "Add",
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
