enum ProductMediaType {
  image,
  video,
  model3d,
}

class ProductMedia {
  final String id;
  final ProductMediaType type;
  final String url;
  final String? thumbnailUrl;
  final int sortOrder;

  const ProductMedia({
    required this.id,
    required this.type,
    required this.url,
    this.thumbnailUrl,
    this.sortOrder = 0,
  });

  bool get isImage => type == ProductMediaType.image;
  bool get isVideo => type == ProductMediaType.video;
  bool get is3dModel => type == ProductMediaType.model3d;

  factory ProductMedia.fromJson(Map<String, dynamic> json) {
    final String rawType = (json['type'] ?? 'IMAGE').toString().toUpperCase();
    ProductMediaType mediaType = ProductMediaType.image;
    if (rawType == 'VIDEO') {
      mediaType = ProductMediaType.video;
    } else if (rawType == 'MODEL_3D' || rawType == '3D') {
      mediaType = ProductMediaType.model3d;
    }

    return ProductMedia(
      id: (json['id'] ?? json['_id'] ?? json['url'] ?? '').toString(),
      type: mediaType,
      url: (json['url'] ?? '').toString(),
      thumbnailUrl: json['thumbnailUrl']?.toString(),
      sortOrder: (json['sortOrder'] is int)
          ? json['sortOrder'] as int
          : (int.tryParse(json['sortOrder']?.toString() ?? '0') ?? 0),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'type': type == ProductMediaType.video
          ? 'VIDEO'
          : type == ProductMediaType.model3d
              ? 'MODEL_3D'
              : 'IMAGE',
      'url': url,
      if (thumbnailUrl != null) 'thumbnailUrl': thumbnailUrl,
      'sortOrder': sortOrder,
    };
  }
}
