import 'package:hq/models/member.dart';
import 'package:hq/models/quest.dart';

class User {
  const User({
    required this.id,
    required this.login,
    required this.fname,
    required this.surname,
    required this.isAdult,
    required this.funds,
    required this.blockedFunds,
    required this.members,
    required this.quests,
  });

  final String id;
  final String login;
  final String fname;
  final String surname;
  final bool isAdult;
  final int funds;
  final int blockedFunds;
  final List<Member> members;
  final List<Quest> quests;

  factory User.fromJson(Map<String, dynamic> json) {
    List<Member> members = [];
    if (json["members"] != null) {
      for (Map<String, dynamic> map in json["members"]) {
        members.add(Member.fromJson(map));
      }
    }

    List<Quest> quests = [];
    if (json["tasks"] != null) {
      for (Map<String, dynamic> map in json["tasks"]) {
        quests.add(Quest.fromJson(map));
      }
    }

    return User(
      id: json["_id"],
      login: json["login"],
      fname: json["fname"],
      surname: json["surname"],
      isAdult: json["isAdult"],
      funds: json["funds"],
      blockedFunds: json["blockedFunds"],
      members: members,
      quests: quests,
    );
  }
}
