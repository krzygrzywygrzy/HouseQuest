import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hq/widgets/cards/avatar.dart';

class ChildCard extends ConsumerWidget {
  const ChildCard({Key? key, required name})
      : _name = name,
        super(key: key);

  final String _name;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Avatar(
            radius: 30,
          ),
          const SizedBox(
            height: 5,
          ),
          Text(_name),
        ],
      ),
    );
  }
}
