

 class AlarmInfo {
  AlarmInfo({
    required this.id,
    required this.title,
    required this.dateTime,
    required this.gradientColorIndex,
    required this.isPending
  });

  int id;
  String title;
  DateTime dateTime;
  int gradientColorIndex;
  int isPending;

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
    "isPending": isPending,
    "dateTime": dateTime.toIso8601String(),
    "gradientColorIndex": gradientColorIndex,
  };

}