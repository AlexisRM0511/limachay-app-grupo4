class Sue {
  final String name;
  final DateTime date;
  final String status;
  final String description;
  final String photo;

  Sue(
      {required this.name,
      required this.date,
      required this.status,
      required this.description,
      required this.photo});

  factory Sue.fromJson(Map<String, dynamic> json) {
    return Sue(
      name: json['name'],
      date: DateTime.parse(json['date']),
      status: json['status'],
      description: json['description'],
      photo: json['photo'],
    );
  }
}
