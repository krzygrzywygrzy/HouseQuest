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
  // ignore: prefer_final_fields
  String _selectedChild = "";

  Future<void> submit() async {
    setState(() {
      _loading = true;
    });

    var fetch = FetchService();
    var data = await fetch.post("/taskAdd", {
      "userID": _selectedChild,
      "title": _titleController.text,
      "description": _descriptionController.text,
      "flashesAmount": _rewardController.text,
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
    final homeData = ref.watch(homeProvider);
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
                      hint: "title",
                    ),
                    CustomTextField(
                      controller: _descriptionController,
                      hint: "description",
                    ),
                    CustomTextField(
                      controller: _rewardController,
                      hint: "reward",
                      keyboardType: TextInputType.number,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: SizedBox(
                          height: 28,
                          child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: homeData.user!.members.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _selectedChild =
                                        homeData.user!.members[index].id;
                                  });
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: _selectedChild ==
                                            homeData.user!.members[index].id
                                        ? Colors.black54
                                        : Colors.transparent,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16, vertical: 4),
                                    child: Center(
                                      child: Text(
                                        homeData.user!.members[index].fname,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
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
