class TypeUsers {
  final String name;

  TypeUsers({required this.name});

  factory TypeUsers.fromJson(Map<String, dynamic> json) {
    return TypeUsers(
      name: json['name'],
    );
  }
}