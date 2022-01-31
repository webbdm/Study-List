class Session {
  final int id;
  final int studyID;
  final String name;
  final String date;

  const Session(
      {required this.id,
      required this.studyID,
      required this.name,
      required this.date});

  factory Session.fromJson(Map<String, dynamic> json) {
    return Session(
      id: json['id'],
      studyID: json['studyID'],
      name: json['name'],
      date: json['date'],
    );
  }
}
