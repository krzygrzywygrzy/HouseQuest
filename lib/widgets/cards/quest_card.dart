import 'package:flutter/material.dart';
import 'package:hq/core/custom_routes/hero_dialog_route.dart';
import 'package:hq/models/quest.dart';
import 'package:hq/widgets/popups/quest.dart';

class QuestCard extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(HeroDialogRoute(builder: (context) {
          return const QuestPopup();
        }));
      },
      child: Material(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        color: Colors.black54,
        child: SizedBox(
          width: 150,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Flexible(
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(
                        "https://64.media.tumblr.com/a22ac63e3dfe35a79d6120332b590ef9/tumblr_oticpms3uF1ui51sko1_1280.jpg"),
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
    );
  }
}
