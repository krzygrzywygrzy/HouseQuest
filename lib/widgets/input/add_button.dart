import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hq/providers/theme_provider.dart';

class AddButton extends ConsumerWidget {
  const AddButton({
    Key? key,
    required this.label,
    required this.onTap,
    required this.tag,
  }) : super(key: key);

  final Function onTap;
  final String tag;
  final String label;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Consumer(builder: (context, ref, _) {
      final darkTheme = ref.watch(themeProvider);
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: GestureDetector(
          onTap: () => onTap(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Hero(
                tag: tag,
                child: CircleAvatar(
                  backgroundColor: darkTheme ? Colors.black54 : Colors.white,
                  child: const Icon(Icons.add),
                  radius: 30,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(label),
            ],
          ),
        ),
      );
    });
  }
}
