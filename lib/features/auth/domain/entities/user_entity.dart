/// Domain Entity representing an authenticated user in Shoppy.
class UserEntity {
  final String id;
  final String name;
  final String email;
  final String role;
  final String avatar;
  final String phone;
  final bool orderUpdates;
  final bool promotions;
  final bool wishlistAlerts;

  const UserEntity({
    required this.id,
    required this.name,
    required this.email,
    this.role = 'CUSTOMER',
    this.avatar = '',
    this.phone = '',
    this.orderUpdates = true,
    this.promotions = true,
    this.wishlistAlerts = true,
  });

  bool get isAdmin => role.toUpperCase() == 'ADMIN';

  UserEntity copyWith({
    String? id,
    String? name,
    String? email,
    String? role,
    String? avatar,
    String? phone,
    bool? orderUpdates,
    bool? promotions,
    bool? wishlistAlerts,
  }) {
    return UserEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      role: role ?? this.role,
      avatar: avatar ?? this.avatar,
      phone: phone ?? this.phone,
      orderUpdates: orderUpdates ?? this.orderUpdates,
      promotions: promotions ?? this.promotions,
      wishlistAlerts: wishlistAlerts ?? this.wishlistAlerts,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserEntity &&
          other.id == id &&
          other.name == name &&
          other.email == email &&
          other.role == role &&
          other.avatar == avatar &&
          other.phone == phone &&
          other.orderUpdates == orderUpdates &&
          other.promotions == promotions &&
          other.wishlistAlerts == wishlistAlerts);

  @override
  int get hashCode => Object.hash(
        id,
        name,
        email,
        role,
        avatar,
        phone,
        orderUpdates,
        promotions,
        wishlistAlerts,
      );

  @override
  String toString() => 'UserEntity(id: $id, name: $name, email: $email, role: $role)';
}
