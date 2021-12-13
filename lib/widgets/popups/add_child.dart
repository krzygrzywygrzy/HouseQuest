import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hq/core/failure.dart';
import 'package:hq/providers/home_provider.dart';
import 'package:hq/services/fetch_service.dart';
import 'package:hq/widgets/input/button.dart';
import 'package:hq/widgets/input/custom_text_field.dart';

// ignore: use_key_in_widget_constructors
class AddChildPopup extends ConsumerStatefulWidget {
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AddChildPopupState();
}

class _AddChildPopupState extends ConsumerState<AddChildPopup> {
  final _fnameController = TextEditingController();
  final _surnameController = TextEditingController();
  final _loginController = TextEditingController();
  final _passwordController = TextEditingController();

  String? _message;
  bool _loading = false;

  Future<void> submit() async {
    setState(() {
      _loading = true;
    });

    var fetch = FetchService();
    var data = await fetch.post("/memberReg", {
      "login": _loginController.text,
      "password": _passwordController.text,
      "fname": _fnameController.text,
      "surname": _surnameController.text,
    });

    data.fold((l) {
      if (l is FetchFailure) {
        _message = l.message;
      } else {
        _message = "Unknown Error Accured";
      }
    }, (r) {
      ref.read(homeProvider.notifier).load();
      Navigator.pop(context);
    });

    setState(() {
      _loading = false;
    });
  }

  Widget? showMessage() {
    if (_message != null) {
      return Center(
        child: Text(
          _message ?? "",
          textAlign: TextAlign.center,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Hero(
        tag: "Add child",
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: SingleChildScrollView(
            child: Material(
              elevation: 2,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Center(
                      child: Text(
                        "Add child",
                        style: TextStyle(fontSize: 22),
                      ),
                    ),
                    CustomTextField(
                      controller: _fnameController,
                      hint: "Name",
                    ),
                    CustomTextField(
                      controller: _surnameController,
                      hint: "Surname",
                    ),
                    CustomTextField(
                      controller: _loginController,
                      hint: "Login",
                    ),
                    CustomTextField(
                      controller: _passwordController,
                      hint: "Password",
                      obscureText: true,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Button(
                          onPress: submit,
                          label: _loading ? "Loading..." : "Add child",
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    showMessage() ?? Container(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
