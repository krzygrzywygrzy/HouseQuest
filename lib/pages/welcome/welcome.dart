import 'package:flutter/material.dart';
import 'package:hq/pages/login/login.dart';
import 'package:hq/pages/register/register.dart';
import 'package:hq/widgets/input/button.dart';

class Welcome extends StatelessWidget {
  const Welcome({Key? key}) : super(key: key);
  static const String path = "/welcome";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Image(
              image: AssetImage("assets/blys.png"),
              height: 120,
            ),
            const Text(
              "HomeQuest",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 25,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Button(
                  onPress: () {
                    Navigator.pushNamed(context, Login.path);
                  },
                  label: "Log in",
                ),
                const SizedBox(
                  width: 10,
                ),
                Button(
                  onPress: () {
                    Navigator.pushNamed(context, Register.path);
                  },
                  label: "Register",
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
