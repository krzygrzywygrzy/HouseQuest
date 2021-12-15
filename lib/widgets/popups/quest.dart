import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hq/models/quest.dart';
import 'package:hq/providers/theme_provider.dart';

class QuestPopup extends ConsumerWidget {
  const QuestPopup({Key? key, hero, required quest})
      : _hero = hero,
        _quest = quest,
        super(key: key);

  final String? _hero;
  final Quest _quest;

  @override
  Widget build(BuildContext context, ref) {
    final darkTheme = ref.read(themeProvider);
    return Center(
      child: Hero(
        tag: _hero ?? "",
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: SingleChildScrollView(
            child: Material(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Center(
                      child: CircleAvatar(
                        radius: 30,
                        backgroundColor:
                            darkTheme ? Colors.black54 : Colors.white,
                        backgroundImage: const NetworkImage(
                          "https://64.media.tumblr.com/a22ac63e3dfe35a79d6120332b590ef9/tumblr_oticpms3uF1ui51sko1_1280.jpg",
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Center(
                      child: Text(
                        _quest.title,
                        style: const TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const Text(
                      "description:",
                      style: TextStyle(color: Colors.white54),
                    ),
                    Material(
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      color: Colors.black54,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(_quest.description),
                      ),
                    ),
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
