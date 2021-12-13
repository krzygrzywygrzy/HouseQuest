class Member {
  const Member({
    required this.id,
    required this.fname,
    required this.parent,
  });

  final String id;
  final String fname;
  final bool parent;

  factory Member.fromJson(Map<String, dynamic> json) {
    return Member(
      id: json["_id"],
      fname: json["fname"],
      parent: json["parent"],
    );
  }
}
