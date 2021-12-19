import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddChild extends ConsumerStatefulWidget {
  const AddChild({Key? key}) : super(key: key);
  static const String path = "/add_child";

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AddChildState();
}

class _AddChildState extends ConsumerState<AddChild> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "Add child",
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
            ],
          ),
        ),
      ),
    );
  }
}
