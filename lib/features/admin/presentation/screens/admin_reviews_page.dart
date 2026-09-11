import 'package:flutter/material.dart';
import 'package:shopp_app/core/theme/app_icons.dart';
import 'package:shopp_app/core/constants/app_icon_sizes.dart';
import 'package:shopp_app/core/widgets/app_icon.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shopp_app/features/reviews/data/models/review_model.dart';
import 'package:shopp_app/features/admin/presentation/providers/admin_providers.dart';

class AdminReviewsPage extends ConsumerStatefulWidget {
  const AdminReviewsPage({super.key});

  @override
  ConsumerState<AdminReviewsPage> createState() => _AdminReviewsPageState();
}

class _AdminReviewsPageState extends ConsumerState<AdminReviewsPage> {
  final TextEditingController _searchController = TextEditingController();
  final List<String> _statusFilters = ['ALL', 'PUBLISHED', 'HIDDEN'];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(adminReviewsNotifierProvider.notifier).loadReviews();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _confirmToggleReviewStatus(
    BuildContext context,
    AdminReviewModel review,
  ) {
    final willHide = review.status == 'PUBLISHED';
    final targetStatus = willHide ? 'HIDDEN' : 'PUBLISHED';
    final reasonController = TextEditingController();

    showDialog(
      context: context,
      builder: (dialogCtx) => AlertDialog(
        title: Text(willHide ? 'Hide Review' : 'Restore Review'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              willHide
                  ? 'Hiding this review will remove it from the public product page and recalculate the product rating.'
                  : 'Restoring this review will make it publicly visible again.',
              style: const TextStyle(fontSize: 13),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: reasonController,
              decoration: const InputDecoration(
                labelText: 'Moderation Reason (Optional)',
                hintText: 'e.g. Inappropriate content / Spam',
                border: OutlineInputBorder(),
                isDense: true,
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogCtx),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: willHide ? Colors.red : Colors.green,
              foregroundColor: Colors.white,
            ),
            onPressed: () async {
              Navigator.pop(dialogCtx);
              final success = await ref
                  .read(adminReviewsNotifierProvider.notifier)
                  .moderateReview(
                    review.id,
                    status: targetStatus,
                    reason: reasonController.text.trim(),
                  );
              if (!mounted) return;
              if (success) {
                ScaffoldMessenger.of(this.context).showSnackBar(
                  SnackBar(
                    content: Text(willHide
                        ? 'Review hidden successfully'
                        : 'Review restored successfully'),
                    backgroundColor: willHide ? Colors.orange : Colors.green,
                  ),
                );
              }
            },
            child: Text(willHide ? 'Hide' : 'Restore'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final reviewsState = ref.watch(adminReviewsNotifierProvider);
    final reviewsNotifier = ref.read(adminReviewsNotifierProvider.notifier);
    final adminReviews = reviewsState.reviews;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Review Moderation',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const AppIcon(AppIcons.refresh, size: AppIconSizes.medium),
            onPressed: () => reviewsNotifier.loadReviews(),
          ),
        ],
      ),
      body: Column(
        children: [
          // Filter Tabs & Search
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 8, 12, 4),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search reviews by comment text...',
                prefixIcon: const Padding(
                  padding: EdgeInsets.all(12),
                  child: AppIcon(AppIcons.search, size: AppIconSizes.medium),
                ),
                isDense: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                suffixIcon: _searchController.text.isNotEmpty
                    ? IconButton(
                        icon: const AppIcon(AppIcons.close, size: AppIconSizes.action),
                        onPressed: () {
                          _searchController.clear();
                          reviewsNotifier.loadReviews(search: '');
                        },
                      )
                    : null,
              ),
              onSubmitted: (query) {
                reviewsNotifier.loadReviews(search: query);
              },
            ),
          ),
          SizedBox(
            height: 48,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              itemCount: _statusFilters.length,
              separatorBuilder: (_, __) => const SizedBox(width: 8),
              itemBuilder: (context, index) {
                final status = _statusFilters[index];
                final isSelected = reviewsState.statusFilter == status;
                return ChoiceChip(
                  label: Text(status),
                  selected: isSelected,
                  onSelected: (_) {
                    reviewsNotifier.loadReviews(status: status);
                  },
                );
              },
            ),
          ),
          const Divider(height: 1),

          // Reviews List
          Expanded(
            child: reviewsState.isLoading && adminReviews.isEmpty
                ? const Center(child: CircularProgressIndicator())
                : adminReviews.isEmpty
                    ? const Center(
                        child: Text(
                          'No reviews found matching criteria',
                          style: TextStyle(color: Colors.grey),
                        ),
                      )
                    : RefreshIndicator(
                        onRefresh: () => reviewsNotifier.loadReviews(),
                        child: ListView.separated(
                          padding: const EdgeInsets.all(12),
                          itemCount: adminReviews.length,
                          separatorBuilder: (_, __) =>
                              const SizedBox(height: 8),
                          itemBuilder: (context, index) {
                            final rev = adminReviews[index];
                            final isPublished = rev.status == 'PUBLISHED';

                            return Card(
                              elevation: 0.5,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                                side: BorderSide(
                                  color: isPublished
                                      ? Colors.grey.shade200
                                      : Colors.red.shade200,
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(12),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Product & Status Row
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: Text(
                                            rev.productName,
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 13,
                                            ),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 6,
                                            vertical: 2,
                                          ),
                                          decoration: BoxDecoration(
                                            color: isPublished
                                                ? Colors.green.shade50
                                                : Colors.red.shade50,
                                            borderRadius:
                                                BorderRadius.circular(4),
                                          ),
                                          child: Text(
                                            rev.status,
                                            style: TextStyle(
                                              fontSize: 10,
                                              fontWeight: FontWeight.bold,
                                              color: isPublished
                                                  ? Colors.green.shade800
                                                  : Colors.red.shade800,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 4),

                                    // Author & Rating
                                    Row(
                                      children: [
                                        Text(
                                          '${rev.userName} (${rev.userEmail})',
                                          style: TextStyle(
                                            fontSize: 11,
                                            color: Colors.grey.shade600,
                                          ),
                                        ),
                                        const Spacer(),
                                        ...List.generate(5, (starIdx) {
                                           return AppIcon(
                                             starIdx < rev.rating
                                                 ? AppIcons.star
                                                 : AppIcons.starEmpty,
                                             size: 14,
                                             color: Colors.amber,
                                           );
                                        }),
                                      ],
                                    ),
                                    const SizedBox(height: 6),

                                    // Comment
                                    Text(
                                      rev.comment,
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey.shade800,
                                      ),
                                    ),
                                    const SizedBox(height: 8),

                                    // Moderation Action Button
                                    Align(
                                      alignment: Alignment.centerRight,
                                      child: OutlinedButton.icon(
                                        style: OutlinedButton.styleFrom(
                                          visualDensity:
                                              VisualDensity.compact,
                                          foregroundColor: isPublished
                                              ? Colors.red
                                              : Colors.green,
                                          side: BorderSide(
                                            color: isPublished
                                                ? Colors.red
                                                : Colors.green,
                                          ),
                                        ),
                                        icon: AppIcon(
                                          isPublished
                                              ? AppIcons.eyeOff
                                              : AppIcons.eye,
                                          size: 16,
                                        ),
                                        label: Text(
                                          isPublished
                                              ? 'Hide Review'
                                              : 'Restore Review',
                                          style:
                                              const TextStyle(fontSize: 11),
                                        ),
                                        onPressed: () =>
                                            _confirmToggleReviewStatus(
                                                context, rev),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
          ),
        ],
      ),
    );
  }
}
