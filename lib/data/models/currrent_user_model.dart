
class CurrentUserModel {
  final String id;
  final String name;
  final String email;

  CurrentUserModel({
    required this.id,
    required this.name,
    required this.email,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
    };
  }

  factory CurrentUserModel.fromJson(Map<String, dynamic> json) {
    return CurrentUserModel(
        id: json['_id'], name: json['name'], email: json['email']);
  }
}
