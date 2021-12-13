import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hq/providers/home_provider.dart';

class ChildCard extends ConsumerWidget {
  const ChildCard({Key? key, required name})
      : _name = name,
        super(key: key);

  final String _name;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeData = ref.watch(homeProvider);
    return GestureDetector(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const CircleAvatar(
            backgroundImage: NetworkImage(
                "https://64.media.tumblr.com/a22ac63e3dfe35a79d6120332b590ef9/tumblr_oticpms3uF1ui51sko1_1280.jpg"),
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
