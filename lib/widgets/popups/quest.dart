import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class QuestPopup extends ConsumerWidget {
  const QuestPopup({Key? key, hero})
      : _hero = hero,
        super(key: key);

  final String? _hero;

  @override
  Widget build(BuildContext context, ref) {
    return Center(
      child: Hero(
        tag: _hero ?? "",
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: SingleChildScrollView(
            child: Material(
              child: Column(
                children: [],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
