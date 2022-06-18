class Users {
  final String name;
  final String lastname;
  final String email;
  final String password;
  final String typeUser;
  final int dni;
  final int status;

  Users({
    required this.name,
    required this.lastname,
    required this.email,
    required this.password,
    required this.typeUser,
    required this.dni,
    required this.status,
  });

  factory Users.fromJson(Map<String, dynamic> json) {
    return Users(
      name: json['name'],
      lastname: json['lastname'],
      email: json['email'],
      password: json['password'],
      typeUser: json['typeUser'],
      dni: json['dni'],
      status: json['status'],
    );
  }
}