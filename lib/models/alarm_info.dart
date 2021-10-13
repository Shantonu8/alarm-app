

 class AlarmInfo {
  AlarmInfo({
    required this.id,
    required this.title,
    required this.dateTime,
    required this.isPending,
    required this.gradientColorIndex,
  });

  int id;
  String title;
  DateTime dateTime;
  bool isPending;
  int gradientColorIndex;

  factory AlarmInfo.fromMap(Map<String, dynamic> json) => AlarmInfo(
    id: json["id"],
    title: json["title"],
    dateTime: DateTime.parse(json["dateTime"]),
    isPending: json["isPending"],
    gradientColorIndex: json["gradientColorIndex"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "title": title,
    "dateTime": dateTime.toIso8601String(),
    "isPending": isPending,
    "gradientColorIndex": gradientColorIndex,
  };

}