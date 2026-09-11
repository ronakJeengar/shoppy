import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_media_entity.freezed.dart';

enum ProductMediaType {
  image,
  video,
  model3d,
}

@freezed
abstract class ProductMediaEntity with _$ProductMediaEntity {
  const ProductMediaEntity._();

  const factory ProductMediaEntity({
    required String id,
    required ProductMediaType type,
    required String url,
    required String thumbnailUrl,
    @Default(0) int sortOrder,
  }) = _ProductMediaEntity;

  bool get isImage => type == ProductMediaType.image;
  bool get isVideo => type == ProductMediaType.video;
  bool get is3dModel => type == ProductMediaType.model3d;
}
