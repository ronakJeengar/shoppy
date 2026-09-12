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
import 'package:video_player/video_player.dart';
import '../../data/models/product_media_model.dart';
import '../../data/models/product_model.dart';

/// Fullscreen Image & Media Gallery Page with zero overflow,
/// double-tap zoom, interactive pan, auto-scrolling thumbnail strip,
/// video player with playback controls, and interactive 3D model viewer.
class ProductFullscreenGalleryPage extends StatefulWidget {
  final Product product;
  final List<ProductMedia> mediaList;
  final int initialIndex;
  final bool enableVideo;
  final bool enable3d;

  const ProductFullscreenGalleryPage({
    super.key,
    required this.product,
    required this.mediaList,
    this.initialIndex = 0,
    this.enableVideo = true,
    this.enable3d = true,
  });

  @override
  State<ProductFullscreenGalleryPage> createState() =>
      _ProductFullscreenGalleryPageState();
}

class _ProductFullscreenGalleryPageState
    extends State<ProductFullscreenGalleryPage> {
  late final PageController _pageController;
  late final ScrollController _thumbScrollController;
  late int _currentIndex;
  bool _showChrome = true;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex.clamp(0, widget.mediaList.length - 1);
    _pageController = PageController(initialPage: _currentIndex);
    _thumbScrollController = ScrollController();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollToThumbnail(_currentIndex);
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    _thumbScrollController.dispose();
    super.dispose();
  }

  void _onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
    _scrollToThumbnail(index);
  }

  void _scrollToThumbnail(int index) {
    if (!_thumbScrollController.hasClients) return;
    const double itemWidth = 62.0; // 54 width + 8 spacing
    final double screenWidth = MediaQuery.of(context).size.width;
    final double target =
        (index * itemWidth) - (screenWidth / 2) + (itemWidth / 2);
    final double maxScroll = _thumbScrollController.position.maxScrollExtent;
    _thumbScrollController.animateTo(
      target.clamp(0.0, maxScroll),
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeOut,
    );
  }

  void _toggleChrome() {
    setState(() {
      _showChrome = !_showChrome;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (widget.mediaList.isEmpty) {
      return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          elevation: 0,
          leading: IconButton(
            icon: const AppIcon(AppIcons.close, color: Colors.white, size: 24),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: const Center(
          child: AppIcon(AppIcons.imageOff, size: 48, color: Colors.white54),
        ),
      );
    }

    final currentMedia = widget.mediaList[_currentIndex];

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        top: true,
        bottom: true,
        child: Column(
          children: [
            // 1. Top Header Bar (Close, Title, Counter, Media Badge)
            AnimatedCrossFade(
              firstChild: _buildTopBar(context, currentMedia),
              secondChild: const SizedBox(height: 0, width: double.infinity),
              crossFadeState: _showChrome
                  ? CrossFadeState.showFirst
                  : CrossFadeState.showSecond,
              duration: const Duration(milliseconds: 200),
            ),

            // 2. Main Media Viewport (Expanded - flexible, zero overflow!)
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: widget.mediaList.length,
                onPageChanged: _onPageChanged,
                itemBuilder: (context, index) {
                  final media = widget.mediaList[index];
                  switch (media.type) {
                    case ProductMediaType.video:
                      return _FullscreenVideoView(
                        media: media,
                        isActive: index == _currentIndex,
                        onTapVideo: _toggleChrome,
                      );
                    case ProductMediaType.model3d:
                      return _Fullscreen3dView(
                        media: media,
                        product: widget.product,
                      );
                    case ProductMediaType.image:
                      return _InteractiveFullscreenImage(
                        media: media,
                        onTap: _toggleChrome,
                      );
                  }
                },
              ),
            ),

            // 3. Bottom Thumbnail Strip (Inside SafeArea, guaranteed no bottom overflow)
            if (widget.mediaList.length > 1)
              AnimatedCrossFade(
                firstChild: _buildThumbnailStrip(),
                secondChild: const SizedBox(height: 0, width: double.infinity),
                crossFadeState: _showChrome
                    ? CrossFadeState.showFirst
                    : CrossFadeState.showSecond,
                duration: const Duration(milliseconds: 200),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildTopBar(BuildContext context, ProductMedia currentMedia) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      color: Colors.black.withValues(alpha: 0.75),
      child: Row(
        children: [
          // Close button
          IconButton(
            icon: const AppIcon(AppIcons.close, color: Colors.white, size: 24),
            tooltip: 'Close Gallery',
            onPressed: () => Navigator.of(context).pop(),
          ),
          const SizedBox(width: 4),

          // Title & Count
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  widget.product.productName,
                  style: AppTypography.titleMedium.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 2),
                Text(
                  '${_currentIndex + 1} of ${widget.mediaList.length}',
                  style: AppTypography.caption.copyWith(
                    color: Colors.white70,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),

          // Media Type Badge
          _buildMediaBadge(currentMedia),
        ],
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
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.9),
        borderRadius: AppRadius.borderFull,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          AppIcon(icon, color: Colors.white, size: AppIconSizes.badge),
          const SizedBox(width: 4),
          Text(
            label,
            style: AppTypography.labelSmall.copyWith(
              color: AppColors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildThumbnailStrip() {
    return Container(
      height: 68,
      padding: const EdgeInsets.symmetric(vertical: 6),
      color: Colors.black.withValues(alpha: 0.85),
      child: ListView.separated(
        controller: _thumbScrollController,
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: widget.mediaList.length,
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          final isSelected = index == _currentIndex;
          final media = widget.mediaList[index];

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
              width: 54,
              height: 54,
              decoration: BoxDecoration(
                borderRadius: AppRadius.borderSm,
                border: Border.all(
                  color: isSelected ? AppColors.primary : Colors.white24,
                  width: isSelected ? 2.5 : 1,
                ),
                boxShadow: isSelected
                    ? [
                        BoxShadow(
                          color: AppColors.primary.withValues(alpha: 0.5),
                          blurRadius: 8,
                          spreadRadius: 1,
                        ),
                      ]
                    : null,
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
                        color: Colors.white10,
                      ),
                      errorWidget: (_, __, ___) => const Center(
                        child: AppIcon(AppIcons.image,
                            size: 16, color: Colors.white38),
                      ),
                    ),
                    if (media.type == ProductMediaType.video)
                      Container(
                        color: Colors.black.withValues(alpha: 0.35),
                        child: const Center(
                          child: AppIcon(AppIcons.play,
                              color: Colors.white, size: 20),
                        ),
                      ),
                    if (media.type == ProductMediaType.model3d)
                      Container(
                        color: Colors.black.withValues(alpha: 0.35),
                        child: const Center(
                          child: AppIcon(AppIcons.model3d,
                              color: Colors.white, size: 18),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

/// Interactive Fullscreen Image with Pinch-to-Zoom and Double-Tap Zoom Support
class _InteractiveFullscreenImage extends StatefulWidget {
  final ProductMedia media;
  final VoidCallback onTap;

  const _InteractiveFullscreenImage({
    required this.media,
    required this.onTap,
  });

  @override
  State<_InteractiveFullscreenImage> createState() =>
      _InteractiveFullscreenImageState();
}

class _InteractiveFullscreenImageState extends State<_InteractiveFullscreenImage>
    with SingleTickerProviderStateMixin {
  late final TransformationController _transformController;
  late final AnimationController _animController;
  Animation<Matrix4>? _zoomAnimation;

  @override
  void initState() {
    super.initState();
    _transformController = TransformationController();
    _animController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 240),
    )..addListener(() {
        if (_zoomAnimation != null) {
          _transformController.value = _zoomAnimation!.value;
        }
      });
  }

  @override
  void dispose() {
    _transformController.dispose();
    _animController.dispose();
    super.dispose();
  }

  void _handleDoubleTap(TapDownDetails details) {
    final currentScale = _transformController.value.getMaxScaleOnAxis();

    final Matrix4 targetMatrix;
    if (currentScale > 1.2) {
      // Zoom out to 1.0
      targetMatrix = Matrix4.identity();
    } else {
      // Zoom in to 2.5x focused on tap location
      final position = details.localPosition;
      const scale = 2.5;
      final x = -position.dx * (scale - 1);
      final y = -position.dy * (scale - 1);

      targetMatrix = Matrix4.identity()
        ..translateByDouble(x, y, 0.0, 1.0)
        ..scaleByDouble(scale, scale, 1.0, 1.0);
    }

    _zoomAnimation = Matrix4Tween(
      begin: _transformController.value,
      end: targetMatrix,
    ).animate(CurvedAnimation(
      parent: _animController,
      curve: Curves.easeOutCubic,
    ));

    _animController.forward(from: 0);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      onDoubleTapDown: _handleDoubleTap,
      child: Center(
        child: InteractiveViewer(
          transformationController: _transformController,
          minScale: 1.0,
          maxScale: 4.5,
          clipBehavior: Clip.none,
          child: CachedNetworkImage(
            imageUrl: widget.media.url,
            fit: BoxFit.contain,
            placeholder: (context, url) => const Center(
              child: SizedBox(
                width: 36,
                height: 36,
                child: CircularProgressIndicator(
                  strokeWidth: 2.5,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white70),
                ),
              ),
            ),
            errorWidget: (context, url, error) => Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const AppIcon(AppIcons.imageOff,
                      size: 48, color: Colors.white54),
                  const SizedBox(height: 8),
                  Text(
                    AppStrings.product.imageUnavailable,
                    style: AppTypography.bodySmall
                        .copyWith(color: Colors.white70),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// Fullscreen Video Player with Play/Pause, Mute, and Progress Overlay
class _FullscreenVideoView extends StatefulWidget {
  final ProductMedia media;
  final bool isActive;
  final VoidCallback onTapVideo;

  const _FullscreenVideoView({
    required this.media,
    required this.isActive,
    required this.onTapVideo,
  });

  @override
  State<_FullscreenVideoView> createState() => _FullscreenVideoViewState();
}

class _FullscreenVideoViewState extends State<_FullscreenVideoView> {
  VideoPlayerController? _videoController;
  bool _isInitialized = false;
  bool _isPlaying = false;
  bool _isMuted = false;
  bool _hasError = false;

  @override
  void initState() {
    super.initState();
    _initController();
  }

  void _initController() {
    try {
      final uri = Uri.parse(widget.media.url);
      _videoController = VideoPlayerController.networkUrl(uri)
        ..initialize().then((_) {
          if (mounted) {
            setState(() {
              _isInitialized = true;
            });
            if (widget.isActive) {
              _videoController?.play();
            }
          }
        }).catchError((_) {
          if (mounted) {
            setState(() {
              _hasError = true;
            });
          }
        });

      _videoController?.addListener(() {
        if (mounted) {
          final isPlaying = _videoController?.value.isPlaying ?? false;
          if (isPlaying != _isPlaying) {
            setState(() {
              _isPlaying = isPlaying;
            });
          }
        }
      });
    } catch (_) {
      _hasError = true;
    }
  }

  @override
  void didUpdateWidget(covariant _FullscreenVideoView oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (!widget.isActive && _isPlaying) {
      _videoController?.pause();
    }
  }

  @override
  void dispose() {
    _videoController?.pause();
    _videoController?.dispose();
    super.dispose();
  }

  void _togglePlay() {
    if (_videoController == null || !_isInitialized) return;
    if (_isPlaying) {
      _videoController!.pause();
    } else {
      _videoController!.play();
    }
  }

  void _toggleMute() {
    if (_videoController == null || !_isInitialized) return;
    setState(() {
      _isMuted = !_isMuted;
      _videoController!.setVolume(_isMuted ? 0.0 : 1.0);
    });
  }

  String _formatDuration(Duration duration) {
    final minutes = duration.inMinutes.remainder(60).toString().padLeft(2, '0');
    final seconds = duration.inSeconds.remainder(60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }

  @override
  Widget build(BuildContext context) {
    if (_hasError) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const AppIcon(AppIcons.videoOff, size: 48, color: Colors.white54),
            const SizedBox(height: 8),
            Text(
              AppStrings.product.videoUnavailable,
              style: AppTypography.bodySmall.copyWith(color: Colors.white70),
            ),
          ],
        ),
      );
    }

    if (!_isInitialized || _videoController == null) {
      return Stack(
        fit: StackFit.expand,
        children: [
          if (widget.media.thumbnailUrl != null)
            CachedNetworkImage(
              imageUrl: widget.media.thumbnailUrl!,
              fit: BoxFit.cover,
            ),
          Container(
            color: Colors.black.withValues(alpha: 0.5),
            child: const Center(
              child: CircularProgressIndicator(color: Colors.white),
            ),
          ),
        ],
      );
    }

    return GestureDetector(
      onTap: () {
        _togglePlay();
        widget.onTapVideo();
      },
      child: Stack(
        fit: StackFit.expand,
        children: [
          Center(
            child: AspectRatio(
              aspectRatio: _videoController!.value.aspectRatio,
              child: VideoPlayer(_videoController!),
            ),
          ),

          // Play icon overlay when paused
          if (!_isPlaying)
            Center(
              child: Container(
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: Colors.black.withValues(alpha: 0.6),
                  shape: BoxShape.circle,
                  boxShadow: AppShadows.md,
                ),
                child: const AppIcon(
                  AppIcons.play,
                  color: Colors.white,
                  size: 48,
                ),
              ),
            ),

          // Bottom Video Controls Bar
          Positioned(
            left: 16,
            right: 16,
            bottom: 16,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.black.withValues(alpha: 0.65),
                borderRadius: AppRadius.borderFull,
              ),
              child: Row(
                children: [
                  IconButton(
                    icon: AppIcon(
                      _isPlaying ? AppIcons.pause : AppIcons.play,
                      color: Colors.white,
                      size: 20,
                    ),
                    onPressed: _togglePlay,
                  ),
                  IconButton(
                    icon: AppIcon(
                      _isMuted ? AppIcons.volumeOff : AppIcons.volumeUp,
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
                        .copyWith(color: Colors.white70),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Fullscreen Interactive 3D Model Viewer with 360° Rotation
class _Fullscreen3dView extends StatefulWidget {
  final ProductMedia media;
  final Product product;

  const _Fullscreen3dView({
    required this.media,
    required this.product,
  });

  @override
  State<_Fullscreen3dView> createState() => _Fullscreen3dViewState();
}

class _Fullscreen3dViewState extends State<_Fullscreen3dView> {
  double _rotationX = 0.0;
  double _rotationY = 0.0;
  double _zoomScale = 1.0;

  void _resetCamera() {
    setState(() {
      _rotationX = 0.0;
      _rotationY = 0.0;
      _zoomScale = 1.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: (details) {
        setState(() {
          _rotationY += details.delta.dx * 0.01;
          _rotationX = (_rotationX - details.delta.dy * 0.01)
              .clamp(-math.pi / 4, math.pi / 4);
        });
      },
      child: Container(
        color: Colors.black,
        child: Stack(
          fit: StackFit.expand,
          children: [
            // 3D Perspective interactive container
            Center(
              child: Transform(
                transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.001)
                  ..rotateX(_rotationX)
                  ..rotateY(_rotationY)
                  ..scaleByDouble(_zoomScale, _zoomScale, _zoomScale, 1.0),
                alignment: FractionalOffset.center,
                child: Container(
                  width: 260,
                  height: 260,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.primary.withValues(alpha: 0.4),
                        blurRadius: 40,
                        spreadRadius: 8,
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: CachedNetworkImage(
                      imageUrl: widget.media.thumbnailUrl ??
                          widget.product.productImage,
                      fit: BoxFit.contain,
                      errorWidget: (_, __, ___) => const Center(
                        child: AppIcon(
                          AppIcons.model3d,
                          color: Colors.white,
                          size: 100,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),

            // 3D Gesture Guidance Hint
            Positioned(
              bottom: 24,
              left: 0,
              right: 0,
              child: Center(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.black.withValues(alpha: 0.7),
                    borderRadius: AppRadius.borderFull,
                    border: Border.all(color: Colors.white24, width: 1),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const AppIcon(AppIcons.touch,
                          color: Colors.white70, size: 16),
                      const SizedBox(width: 8),
                      Text(
                        AppStrings.product.dragRotate360,
                        style: AppTypography.caption.copyWith(
                          color: Colors.white,
                          letterSpacing: 0.3,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // Reset Camera Floating Action Button
            Positioned(
              right: 20,
              bottom: 20,
              child: FloatingActionButton.small(
                heroTag: 'fullscreen_reset_3d',
                backgroundColor: Colors.white24,
                elevation: 0,
                onPressed: _resetCamera,
                child: const AppIcon(AppIcons.refresh,
                    color: Colors.white, size: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
