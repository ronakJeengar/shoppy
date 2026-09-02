class CurrentUserModel {
  final String id;
  final String name;
  final String email;
  final String role;
  final String avatar;

  CurrentUserModel({
    required this.id,
    required this.name,
    required this.email,
    this.role = 'CUSTOMER',
    this.avatar = '',
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      '_id': id,
      'name': name,
      'fullName': name,
      'email': email,
      'role': role,
      'avatar': avatar,
    };
  }

  factory CurrentUserModel.fromJson(Map<String, dynamic> json) {
    return CurrentUserModel(
      id: (json['id'] ?? json['_id'] ?? '').toString(),
      name: (json['name'] ?? json['fullName'] ?? '').toString(),
      email: (json['email'] ?? '').toString(),
      role: (json['role'] ?? 'CUSTOMER').toString(),
      avatar: (json['avatar'] ?? '').toString(),
    );
  }
}
