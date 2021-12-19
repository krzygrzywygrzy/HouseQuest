import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hq/models/quest.dart';
import 'package:hq/providers/theme_provider.dart';

class QuestCard extends ConsumerWidget {
  const QuestCard({Key? key, required quest})
      : _quest = quest,
        super(key: key);

  final Quest _quest;

  Color statusColor() {
    switch (_quest.iType) {
      case 1:
        return Colors.red;
      case 2:
        return Colors.yellow;
      case 3:
        return Colors.green;
      default:
        return Colors.blue;
    }
  }

  @override
  Widget build(BuildContext context, ref) {
    final darkTheme = ref.watch(themeProvider);
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: GestureDetector(
        onTap: () {},
        child: Hero(
          tag: _quest.sId,
          child: Material(
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            color: darkTheme ? Colors.black54 : Colors.white,
            child: SizedBox(
              width: 150,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Flexible(
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(
                          "https://64.media.tumblr.com/a22ac63e3dfe35a79d6120332b590ef9/tumblr_oticpms3uF1ui51sko1_1280.jpg",
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(
                          child: Text(
                            _quest.title,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        CircleAvatar(
                          radius: 5,
                          backgroundColor: statusColor(),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      _quest.childName ?? "",
                      style: const TextStyle(
                        fontSize: 12,
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
