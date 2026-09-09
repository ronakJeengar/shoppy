enum ProductMediaType {
  image,
  video,
  model3d,
}

class ProductMediaEntity {
  final String id;
  final ProductMediaType type;
  final String url;
  final String thumbnailUrl;
  final int sortOrder;

  const ProductMediaEntity({
    required this.id,
    required this.type,
    required this.url,
    required this.thumbnailUrl,
    this.sortOrder = 0,
  });

  bool get isImage => type == ProductMediaType.image;
  bool get isVideo => type == ProductMediaType.video;
  bool get is3dModel => type == ProductMediaType.model3d;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProductMediaEntity &&
          other.id == id &&
          other.type == type &&
          other.url == url &&
          other.thumbnailUrl == thumbnailUrl &&
          other.sortOrder == sortOrder);

  @override
  int get hashCode => Object.hash(id, type, url, thumbnailUrl, sortOrder);
}
