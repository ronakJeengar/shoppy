import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_radius.dart';
import '../providers/campaign_providers.dart';
import 'campaign_card.dart';

class CampaignBannerCarousel extends ConsumerStatefulWidget {
  final double height;

  const CampaignBannerCarousel({
    super.key,
    this.height = 168.0,
  });

  @override
  ConsumerState<CampaignBannerCarousel> createState() =>
      _CampaignBannerCarouselState();
}

class _CampaignBannerCarouselState
    extends ConsumerState<CampaignBannerCarousel> {
  late final PageController _pageController;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final campaignsAsync = ref.watch(activeCampaignsProvider);

    return campaignsAsync.when(
      loading: () => _buildLoadingSkeleton(),
      error: (error, stackTrace) {
        // Section 19: Error state degrades gracefully, does not crash or block Home
        return const SizedBox.shrink();
      },
      data: (campaigns) {
        // Section 17: Empty state gracefully hides section without showing fake banners
        if (campaigns.isEmpty) {
          return const SizedBox.shrink();
        }

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: widget.height,
                child: PageView.builder(
                  controller: _pageController,
                  onPageChanged: (idx) {
                    if (mounted) {
                      setState(() {
                        _currentIndex = idx;
                      });
                    }
                  },
                  itemCount: campaigns.length,
                  itemBuilder: (context, index) {
                    final campaign = campaigns[index];
                    return CampaignCard(
                      campaign: campaign,
                      height: widget.height,
                    );
                  },
                ),
              ),
              if (campaigns.length > 1) ...[
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    campaigns.length,
                    (index) => AnimatedContainer(
                      duration: const Duration(milliseconds: 250),
                      curve: Curves.easeInOut,
                      width: _currentIndex == index ? 18 : 6,
                      height: 5,
                      margin: const EdgeInsets.symmetric(horizontal: 2.5),
                      decoration: BoxDecoration(
                        color: _currentIndex == index
                            ? AppColors.primary
                            : AppColors.slate300,
                        borderRadius: AppRadius.borderFull,
                      ),
                    ),
                  ),
                ),
              ],
            ],
          ),
        );
      },
    );
  }

  Widget _buildLoadingSkeleton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Container(
        height: widget.height,
        decoration: const BoxDecoration(
          color: AppColors.slate100,
          borderRadius: AppRadius.borderLg,
        ),
      ),
    );
  }
}
