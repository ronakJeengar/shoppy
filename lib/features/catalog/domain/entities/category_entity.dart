class CategoryEntity {
  final String id;
  final String name;
  final String? image;
  final String? description;

  const CategoryEntity({
    required this.id,
    required this.name,
    this.image,
    this.description,
  });

  String get displayName => name;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CategoryEntity &&
          other.id == id &&
          other.name == name &&
          other.image == image &&
          other.description == description);

  @override
  int get hashCode => Object.hash(id, name, image, description);

  @override
  String toString() => 'CategoryEntity(id: $id, name: $name)';
}
