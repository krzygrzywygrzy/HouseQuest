import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hq/core/failure.dart';
import 'package:hq/providers/home_provider.dart';
import 'package:hq/services/fetch_service.dart';
import 'package:hq/widgets/input/button.dart';
import 'package:hq/widgets/input/custom_text_field.dart';

class AddQuestPopup extends ConsumerStatefulWidget {
  const AddQuestPopup({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AddQuestPopupState();
}

class _AddQuestPopupState extends ConsumerState<AddQuestPopup> {
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _rewardController = TextEditingController();

  String? _message;
  bool _loading = false;

  Future<void> submit() async {
    setState(() {
      _loading = true;
    });

    // var fetch = FetchService();
    // var data = await fetch.post("/memberReg", {
    //   "login": _loginController.text,
    //   "password": _passwordController.text,
    //   "fname": _fnameController.text,
    //   "surname": _surnameController.text,
    // });

    // data.fold((l) {
    //   if (l is FetchFailure) {
    //     _message = l.message;
    //   } else {
    //     _message = "Unknown Error Accured";
    //   }
    // }, (r) {
    //   ref.read(homeProvider.notifier).load();
    //   Navigator.pop(context);
    // });

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
        tag: "Add quest",
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
                        "Add quest",
                        style: TextStyle(fontSize: 22),
                      ),
                    ),
                    CustomTextField(
                      controller: _titleController,
                      hint: "name",
                    ),
                    CustomTextField(
                      controller: _descriptionController,
                      hint: "surname",
                    ),
                    CustomTextField(
                      controller: _rewardController,
                      hint: "login",
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Button(
                          onPress: submit,
                          label: _loading ? "Loading..." : "Add quest",
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
