class Quest {
  String? childName;
  String sId;
  String title;
  String description;
  int? flashesAmount;
  int iType;

  Quest({
    this.childName,
    required this.sId,
    required this.title,
    required this.description,
    this.flashesAmount,
    required this.iType,
  });

  factory Quest.fromJson(Map<String, dynamic> json) {
    return Quest(
      childName: json['childName'],
      sId: json['_id'],
      title: json['title'],
      description: json['description'],
      flashesAmount: json['flashesAmount'],
      iType: json['_type'],
    );
  }
}
