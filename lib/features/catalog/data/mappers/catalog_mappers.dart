import '../models/category_model.dart';
import '../models/product_media_model.dart';
import '../models/product_model.dart';
import '../../domain/entities/category_entity.dart';
import '../../domain/entities/product_entity.dart';

extension CategoryModelMapper on CategoryModel {
  CategoryEntity toEntity() {
    return CategoryEntity(
      id: id,
      name: name,
    );
  }
}

extension CategoryEntityMapper on CategoryEntity {
  CategoryModel toModel() {
    return CategoryModel(
      id: id,
      name: name,
    );
  }
}

extension ProductMediaModelMapper on ProductMediaModel {
  ProductMediaEntity toEntity() {
    return ProductMediaEntity(
      id: id,
      type: type,
      url: url,
      thumbnailUrl: thumbnailUrl ?? url,
      sortOrder: sortOrder,
    );
  }
}

extension ProductModelMapper on ProductModel {
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
      media: media.map((m) => m.toEntity()).toList(),
    );
  }
}

extension ProductEntityMapper on ProductEntity {
  ProductModel toModel() {
    return ProductModel(
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
      media: media
          .map((m) => ProductMediaModel(
                id: m.id,
                type: m.type,
                url: m.url,
                thumbnailUrl: m.thumbnailUrl,
                sortOrder: m.sortOrder,
              ))
          .toList(),
    );
  }
}
