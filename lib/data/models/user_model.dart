import 'dart:convert';

class User {
  // final String id;
  final String name;
  final String email;
  final String password;

  // final String token;

  User({
    // required this.id,
    required this.name,
    required this.email,
    required this.password,
    // required this.token
  });

  Map<String, dynamic> toMap() {
    return {
      // 'id': id,
      'name': name,
      'email': email,
      'password': password,
      // 'token': token
    };
  }

  factory User.fromMap(Map<String, dynamic> json) {
    return User(
        // id: json['_id'],
        name: json['name'],
        email: json['email'],
        password: json['password']);
    // token: json['token']);
  }

  String toJson() => jsonEncode(toMap());

  factory User.fromJson(String s) => User.fromMap(jsonDecode(s));
}
