import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hq/models/quest.dart';

class QuestCard extends ConsumerStatefulWidget {
  const QuestCard({
    Key? key,
    required quest,
  })  : _quest = quest,
        super(key: key);

  final Quest _quest;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _QuestCardState();
}

class _QuestCardState extends ConsumerState<QuestCard> {
  bool _opened = false;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      color: Colors.black54,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      widget._quest.title,
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                    Text(
                      " | ${widget._quest.childName}",
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _opened = !_opened;
                    });
                  },
                  child: Icon(_opened
                      ? Icons.arrow_drop_up
                      : Icons.arrow_drop_down_sharp),
                )
              ],
            ),
            _opened
                ? Column(
                    children: [
                      Row(
                        children: [
                          const Text(
                            "description: ",
                            style: TextStyle(color: Colors.white54),
                          ),
                          Text(widget._quest.description),
                        ],
                      ),
                      Row(
                        children: [
                          const Text(
                            "reward: ",
                            style: TextStyle(color: Colors.white54),
                          ),
                          Text(widget._quest.flashesAmount.toString()),
                        ],
                      ),
                    ],
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
