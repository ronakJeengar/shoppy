import 'package:shopp_app/data/models/category_model.dart';
import 'package:shopp_app/data/models/product_media_model.dart' as model;
import 'package:shopp_app/data/models/product_model.dart';
import 'package:shopp_app/features/catalog/domain/entities/category_entity.dart';
import 'package:shopp_app/features/catalog/domain/entities/product_entity.dart';
import 'package:shopp_app/features/catalog/domain/entities/product_media_entity.dart' as entity;

extension ProductMediaMapper on model.ProductMedia {
  entity.ProductMediaEntity toEntity() {
    entity.ProductMediaType entityType;
    switch (type) {
      case model.ProductMediaType.video:
        entityType = entity.ProductMediaType.video;
        break;
      case model.ProductMediaType.model3d:
        entityType = entity.ProductMediaType.model3d;
        break;
      case model.ProductMediaType.image:
        entityType = entity.ProductMediaType.image;
        break;
    }

    return entity.ProductMediaEntity(
      id: id,
      type: entityType,
      url: url,
      thumbnailUrl: thumbnailUrl ?? url,
      sortOrder: sortOrder,
    );
  }
}

extension CategoryMapper on CategoryModel {
  CategoryEntity toEntity() {
    return CategoryEntity(
      id: id,
      name: name,
    );
  }
}

extension ProductMapper on Product {
  ProductEntity toEntity() {
    return ProductEntity(
      id: id,
      productName: productName,
      sellerName: sellerName,
      description: description,
      price: price,
      stock: stock,
      productRating: productRating,
      totalReviews: totalReviews,
      productImage: productImage,
      categoryId: categoryId,
      categoryName: categoryName,
      isActive: isActive,
      images: images,
      videoUrl: videoUrl,
      model3dUrl: model3dUrl,
      media: allMedia.map((m) => m.toEntity()).toList(),
    );
  }
}

extension ProductEntityMapper on ProductEntity {
  Product toModel() {
    return Product(
      id: id,
      productName: productName,
      sellerName: sellerName,
      description: description,
      price: price,
      stock: stock,
      productRating: productRating,
      totalReviews: totalReviews,
      productImage: productImage,
      categoryId: categoryId,
      categoryName: categoryName,
      isActive: isActive,
      images: images,
      videoUrl: videoUrl,
      model3dUrl: model3dUrl,
    );
  }
}
