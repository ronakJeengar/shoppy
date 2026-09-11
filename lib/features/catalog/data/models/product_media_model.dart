import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/product_media_entity.dart';
export '../../domain/entities/product_media_entity.dart';

part 'product_media_model.freezed.dart';

@freezed
abstract class ProductMediaModel with _$ProductMediaModel {
  const ProductMediaModel._();

  const factory ProductMediaModel({
    required String id,
    required ProductMediaType type,
    required String url,
    String? thumbnailUrl,
    @Default(0) int sortOrder,
  }) = _ProductMediaModel;

  bool get isImage => type == ProductMediaType.image;
  bool get isVideo => type == ProductMediaType.video;
  bool get is3dModel => type == ProductMediaType.model3d;

  factory ProductMediaModel.fromJson(Map<String, dynamic> json) {
    final String rawType = (json['type'] ?? 'IMAGE').toString().toUpperCase();
    ProductMediaType mediaType = ProductMediaType.image;
    if (rawType == 'VIDEO') {
      mediaType = ProductMediaType.video;
    } else if (rawType == 'MODEL_3D' || rawType == '3D') {
      mediaType = ProductMediaType.model3d;
    }

    return ProductMediaModel(
      id: (json['id'] ?? json['_id'] ?? json['url'] ?? '').toString(),
      type: mediaType,
      url: (json['url'] ?? '').toString(),
      thumbnailUrl: json['thumbnailUrl']?.toString(),
      sortOrder: (json['sortOrder'] is int)
          ? json['sortOrder'] as int
          : (int.tryParse(json['sortOrder']?.toString() ?? '0') ?? 0),
    );
  }
}

extension ProductMediaModelX on ProductMediaModel {
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'type': type.name.toUpperCase(),
      'url': url,
      'thumbnailUrl': thumbnailUrl,
      'sortOrder': sortOrder,
    };
  }
}

typedef ProductMedia = ProductMediaModel;
