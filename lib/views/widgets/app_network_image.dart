import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shopp_app/core/theme/app_colors.dart';
import 'package:shopp_app/core/theme/app_radius.dart';
import 'package:shopp_app/views/widgets/skeleton_loader.dart';

/// A 60 FPS zero-jank network image loader with automatic memory resizing,
/// disk caching, smooth shimmer placeholder, and fallback error handling.
class AppNetworkImage extends StatelessWidget {
  final String imageUrl;
  final double? width;
  final double? height;
  final BoxFit fit;
  final BorderRadius? borderRadius;
  final int? memCacheWidth;
  final int? memCacheHeight;
  final Widget? placeholder;
  final Widget? errorWidget;

  const AppNetworkImage({
    super.key,
    required this.imageUrl,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.borderRadius,
    this.memCacheWidth,
    this.memCacheHeight,
    this.placeholder,
    this.errorWidget,
  });

  @override
  Widget build(BuildContext context) {
    if (imageUrl.isEmpty) {
      return _buildErrorPlaceholder();
    }

    Widget image = CachedNetworkImage(
      imageUrl: imageUrl,
      width: width,
      height: height,
      fit: fit,
      // Target reasonable memory dimensions to protect frame rates
      memCacheWidth: memCacheWidth ?? (width != null ? (width! * 2).toInt() : 600),
      memCacheHeight: memCacheHeight ?? (height != null ? (height! * 2).toInt() : 600),
      fadeInDuration: const Duration(milliseconds: 200),
      fadeOutDuration: const Duration(milliseconds: 150),
      placeholder: (context, url) =>
          placeholder ??
          SkeletonLoader(
            width: width ?? double.infinity,
            height: height ?? double.infinity,
            borderRadius: borderRadius ?? BorderRadius.zero,
          ),
      errorWidget: (context, url, error) => errorWidget ?? _buildErrorPlaceholder(),
    );

    if (borderRadius != null) {
      image = ClipRRect(
        borderRadius: borderRadius!,
        child: image,
      );
    }

    return image;
  }

  Widget _buildErrorPlaceholder() {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: AppColors.slate100,
        borderRadius: borderRadius ?? AppRadius.borderSm,
      ),
      child: const Center(
        child: Icon(
          Icons.inventory_2_outlined,
          color: AppColors.slate400,
          size: 28,
        ),
      ),
    );
  }
}
