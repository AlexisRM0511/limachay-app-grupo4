class Status {
  final String name;

  Status({required this.name});

  factory Status.fromJson(Map<String, dynamic> json) {
    return Status(
      name: json['name'],
    );
  }
}
