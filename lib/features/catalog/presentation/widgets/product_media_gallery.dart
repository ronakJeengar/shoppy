import 'dart:math' as math;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shopp_app/core/constants/app_strings.dart';
import 'package:shopp_app/core/theme/app_colors.dart';
import 'package:shopp_app/core/theme/app_radius.dart';
import 'package:shopp_app/core/theme/app_shadows.dart';
import 'package:shopp_app/core/theme/app_icons.dart';
import 'package:shopp_app/core/theme/app_typography.dart';
import 'package:shopp_app/core/constants/app_icon_sizes.dart';
import 'package:shopp_app/core/widgets/app_icon.dart';
import '../../data/models/product_media_model.dart';
import '../../data/models/product_model.dart';
import 'package:video_player/video_player.dart';

/// Premium Multi-Media Gallery supporting Images, Real Videos, and Interactive 3D Product Viewer.
class ProductMediaGallery extends StatefulWidget {
  final Product product;
  final double height;
  final bool enableVideo;
  final bool enable3d;

  const ProductMediaGallery({
    super.key,
    required this.product,
    this.height = 360,
    this.enableVideo = true,
    this.enable3d = true,
  });

  @override
  State<ProductMediaGallery> createState() => _ProductMediaGalleryState();
}

class _ProductMediaGalleryState extends State<ProductMediaGallery> {
  late final PageController _pageController;
  late List<ProductMedia> _mediaList;
  int _currentIndex = 0;

  // Video controller state
  VideoPlayerController? _videoController;
  bool _isVideoInitialized = false;
  bool _isVideoPlaying = false;
  bool _isVideoMuted = false;
  bool _hasVideoError = false;

  // 3D Viewer Interactive State
  double _rotationX = 0.0;
  double _rotationY = 0.0;
  double _zoomScale = 1.0;

  List<ProductMedia> _computeMediaList() {
    return widget.product.allMedia.where((m) {
      if (m.type == ProductMediaType.video && !widget.enableVideo) return false;
      if (m.type == ProductMediaType.model3d && !widget.enable3d) return false;
      return true;
    }).toList();
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _mediaList = _computeMediaList();

    _initVideoIfAvailable();
  }

  void _initVideoIfAvailable() {
    if (!widget.enableVideo) return;
    if (widget.product.hasVideo && widget.product.videoUrl != null) {
      try {
        final uri = Uri.parse(widget.product.videoUrl!);
        _videoController = VideoPlayerController.networkUrl(uri)
          ..initialize().then((_) {
            if (mounted) {
              setState(() {
                _isVideoInitialized = true;
              });
            }
          }).catchError((err) {
            if (mounted) {
              setState(() {
                _hasVideoError = true;
              });
            }
          });

        _videoController?.addListener(() {
          if (mounted) {
            final isPlaying = _videoController?.value.isPlaying ?? false;
            if (isPlaying != _isVideoPlaying) {
              setState(() {
                _isVideoPlaying = isPlaying;
              });
            }
          }
        });
      } catch (_) {
        _hasVideoError = true;
      }
    }
  }

  @override
  void didUpdateWidget(covariant ProductMediaGallery oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.enableVideo != widget.enableVideo ||
        oldWidget.enable3d != widget.enable3d ||
        oldWidget.product != widget.product) {
      setState(() {
        _mediaList = _computeMediaList();
        if (_currentIndex >= _mediaList.length && _mediaList.isNotEmpty) {
          _currentIndex = 0;
        }
      });
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    _videoController?.pause();
    _videoController?.dispose();
    super.dispose();
  }

  void _onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });

    // Pause video if moving away from video tab
    if (_mediaList.isNotEmpty &&
        _mediaList[index].type != ProductMediaType.video &&
        _isVideoPlaying) {
      _videoController?.pause();
    }
  }

  void _togglePlayPause() {
    if (_videoController == null || !_isVideoInitialized) return;
    if (_videoController!.value.isPlaying) {
      _videoController!.pause();
    } else {
      _videoController!.play();
    }
  }

  void _toggleMute() {
    if (_videoController == null || !_isVideoInitialized) return;
    setState(() {
      _isVideoMuted = !_isVideoMuted;
      _videoController!.setVolume(_isVideoMuted ? 0.0 : 1.0);
    });
  }

  void _reset3dCamera() {
    setState(() {
      _rotationX = 0.0;
      _rotationY = 0.0;
      _zoomScale = 1.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_mediaList.isEmpty) {
      return Container(
        height: widget.height,
        color: AppColors.slate100,
        alignment: Alignment.center,
        child: const AppIcon(AppIcons.imageOff,
            size: 48, color: AppColors.slate400),
      );
    }

    return Column(
      children: [
        // Main Viewport
        Container(
          height: widget.height,
          width: double.infinity,
          decoration: const BoxDecoration(
            color: AppColors.slate100,
          ),
          child: Stack(
            fit: StackFit.expand,
            children: [
              PageView.builder(
                controller: _pageController,
                itemCount: _mediaList.length,
                onPageChanged: _onPageChanged,
                itemBuilder: (context, index) {
                  final media = _mediaList[index];
                  switch (media.type) {
                    case ProductMediaType.video:
                      return _buildVideoPlayer(media);
                    case ProductMediaType.model3d:
                      return _build3dViewer(media);
                    case ProductMediaType.image:
                      return _buildImageViewer(media);
                  }
                },
              ),

              // Media Badge Overlay (top-left)
              Positioned(
                top: 16,
                left: 16,
                child: _buildMediaBadge(_mediaList[_currentIndex]),
              ),

              // Fullscreen trigger (top-right)
              Positioned(
                top: 16,
                right: 16,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black.withValues(alpha: 0.35),
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    icon: const AppIcon(AppIcons.fullscreen,
                        color: Colors.white, size: 22),
                    tooltip: AppStrings.product.fullscreen,
                    onPressed: () => _openFullscreenMedia(context),
                  ),
                ),
              ),

              // Page Indicator Dots / Pills (bottom center)
              Positioned(
                bottom: 16,
                left: 0,
                right: 0,
                child: Center(
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                      color: Colors.black.withValues(alpha: 0.35),
                      borderRadius: AppRadius.borderFull,
                    ),
                    child: Text(
                      '${_currentIndex + 1} / ${_mediaList.length}',
                      style: AppTypography.caption.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),

        // Thumbnail Strip
        if (_mediaList.length > 1) ...[
          const SizedBox(height: 12),
          SizedBox(
            height: 56,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: _mediaList.length,
              separatorBuilder: (_, __) => const SizedBox(width: 8),
              itemBuilder: (context, index) {
                final isSelected = index == _currentIndex;
                final media = _mediaList[index];

                return GestureDetector(
                  onTap: () {
                    _pageController.animateToPage(
                      index,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    width: 56,
                    height: 56,
                    decoration: BoxDecoration(
                      borderRadius: AppRadius.borderSm,
                      border: Border.all(
                        color: isSelected
                            ? AppColors.primary
                            : AppColors.slate200,
                        width: isSelected ? 2.5 : 1,
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(6),
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          CachedNetworkImage(
                            imageUrl: media.thumbnailUrl ?? media.url,
                            fit: BoxFit.cover,
                            placeholder: (_, __) => Container(
                              color: AppColors.slate100,
                            ),
                            errorWidget: (_, __, ___) => const Center(
                              child: AppIcon(AppIcons.image,
                                  size: 18, color: AppColors.slate400),
                            ),
                          ),
                          if (media.type == ProductMediaType.video)
                            Container(
                              color: Colors.black.withValues(alpha: 0.3),
                              child: const Center(
                                child: AppIcon(AppIcons.play,
                                    color: Colors.white, size: 24),
                              ),
                            ),
                          if (media.type == ProductMediaType.model3d)
                            Container(
                              color: Colors.black.withValues(alpha: 0.3),
                              child: const Center(
                                child: AppIcon(AppIcons.model3d,
                                    color: Colors.white, size: 22),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildImageViewer(ProductMedia media) {
    return InteractiveViewer(
      minScale: 1.0,
      maxScale: 3.5,
      child: Center(
        child: CachedNetworkImage(
          imageUrl: media.url,
          fit: BoxFit.contain,
          placeholder: (context, url) => Center(
            child: SizedBox(
              width: 32,
              height: 32,
              child: CircularProgressIndicator(
                strokeWidth: 2.5,
                valueColor: AlwaysStoppedAnimation<Color>(
                  AppColors.primary.withValues(alpha: 0.7),
                ),
              ),
            ),
          ),
          errorWidget: (context, url, error) => Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const AppIcon(AppIcons.imageOff,
                    size: 40, color: AppColors.slate400),
                const SizedBox(height: 6),
                Text(AppStrings.product.imageUnavailable,
                    style: AppTypography.caption
                        .copyWith(color: AppColors.slate500)),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildVideoPlayer(ProductMedia media) {
    if (_hasVideoError) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const AppIcon(AppIcons.videoOff,
                size: 48, color: AppColors.slate400),
            const SizedBox(height: 8),
            Text(AppStrings.product.videoUnavailable,
                style: AppTypography.bodySmall
                    .copyWith(color: AppColors.slate600)),
          ],
        ),
      );
    }

    if (!_isVideoInitialized || _videoController == null) {
      return Stack(
        fit: StackFit.expand,
        children: [
          if (media.thumbnailUrl != null)
            CachedNetworkImage(
              imageUrl: media.thumbnailUrl!,
              fit: BoxFit.cover,
            ),
          Container(
            color: Colors.black.withValues(alpha: 0.4),
            child: const Center(
              child: CircularProgressIndicator(color: Colors.white),
            ),
          ),
        ],
      );
    }

    return GestureDetector(
      onTap: _togglePlayPause,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Center(
            child: AspectRatio(
              aspectRatio: _videoController!.value.aspectRatio,
              child: VideoPlayer(_videoController!),
            ),
          ),

          // Play / Pause central button overlay (when paused)
          if (!_isVideoPlaying)
            Center(
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.black.withValues(alpha: 0.55),
                  shape: BoxShape.circle,
                  boxShadow: AppShadows.md,
                ),
                child: const AppIcon(
                  AppIcons.play,
                  color: Colors.white,
                  size: 44,
                ),
              ),
            ),

          // Video bottom control bar
          Positioned(
            left: 16,
            right: 16,
            bottom: 36,
            child: Row(
              children: [
                IconButton(
                  icon: AppIcon(
                    _isVideoPlaying
                        ? AppIcons.pause
                        : AppIcons.play,
                    color: Colors.white,
                    size: 20,
                  ),
                  onPressed: _togglePlayPause,
                ),
                IconButton(
                  icon: AppIcon(
                    _isVideoMuted
                        ? AppIcons.volumeOff
                        : AppIcons.volumeUp,
                    color: Colors.white,
                    size: 20,
                  ),
                  onPressed: _toggleMute,
                ),
                const Spacer(),
                Text(
                  _formatDuration(_videoController!.value.position),
                  style: AppTypography.caption.copyWith(color: Colors.white),
                ),
                Text(
                  ' / ${_formatDuration(_videoController!.value.duration)}',
                  style: AppTypography.caption
                      .copyWith(color: Colors.white.withValues(alpha: 0.7)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _build3dViewer(ProductMedia media) {
    return GestureDetector(
      onPanUpdate: (details) {
        setState(() {
          _rotationY += details.delta.dx * 0.01;
          _rotationX = (_rotationX - details.delta.dy * 0.01)
              .clamp(-math.pi / 4, math.pi / 4);
        });
      },
      child: Container(
        color: AppColors.slate900,
        child: Stack(
          fit: StackFit.expand,
          children: [
            // 3D Perspective interactive container
            Center(
              child: Transform(
                transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.001) // perspective
                  ..rotateX(_rotationX)
                  ..rotateY(_rotationY)
                  ..scaleByDouble(_zoomScale, _zoomScale, _zoomScale, 1.0),
                alignment: FractionalOffset.center,
                child: Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.primary.withValues(alpha: 0.35),
                        blurRadius: 30,
                        spreadRadius: 5,
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: CachedNetworkImage(
                      imageUrl: media.thumbnailUrl ??
                          widget.product.productImage,
                      fit: BoxFit.contain,
                      errorWidget: (_, __, ___) => const Center(
                        child: AppIcon(
                          AppIcons.model3d,
                          color: Colors.white,
                          size: 80,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),

            // 3D Gesture Guidance Hint
            Positioned(
              bottom: 40,
              left: 0,
              right: 0,
              child: Center(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.black.withValues(alpha: 0.6),
                    borderRadius: AppRadius.borderFull,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const AppIcon(AppIcons.touch,
                          color: Colors.white70, size: 16),
                      const SizedBox(width: 6),
                      Text(
                        AppStrings.product.dragRotate360,
                        style: AppTypography.caption.copyWith(
                          color: Colors.white,
                          letterSpacing: 0.2,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // 3D Controls
            Positioned(
              right: 16,
              bottom: 36,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  FloatingActionButton.small(
                    heroTag: 'reset_3d',
                    backgroundColor: Colors.white24,
                    elevation: 0,
                    onPressed: _reset3dCamera,
                    child: const AppIcon(AppIcons.refresh,
                        color: Colors.white, size: 18),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMediaBadge(ProductMedia media) {
    String icon;
    String label;
    Color color;

    switch (media.type) {
      case ProductMediaType.video:
        icon = AppIcons.play;
        label = AppStrings.product.mediaVideo;
        color = AppColors.secondary;
        break;
      case ProductMediaType.model3d:
        icon = AppIcons.model3d;
        label = AppStrings.product.media3d;
        color = AppColors.violet;
        break;
      case ProductMediaType.image:
        icon = AppIcons.camera;
        label = AppStrings.product.mediaPhoto;
        color = AppColors.primary;
        break;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.9),
        borderRadius: AppRadius.borderSm,
        boxShadow: AppShadows.sm,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          AppIcon(icon, color: Colors.white, size: AppIconSizes.badge),
          const SizedBox(width: 4),
          Text(
            label,
            style: AppTypography.labelSmall.copyWith(color: AppColors.white),
          ),
        ],
      ),
    );
  }

  void _openFullscreenMedia(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        fullscreenDialog: true,
        builder: (_) => Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            iconTheme: const IconThemeData(color: Colors.white),
            title: Text(
              widget.product.productName,
              style: AppTypography.titleMedium.copyWith(color: Colors.white),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          body: Center(
            child: ProductMediaGallery(
              product: widget.product,
              height: MediaQuery.of(context).size.height * 0.8,
            ),
          ),
        ),
      ),
    );
  }

  String _formatDuration(Duration duration) {
    final minutes = duration.inMinutes.remainder(60).toString().padLeft(2, '0');
    final seconds = duration.inSeconds.remainder(60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }
}
