import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopp_app/data/models/review_model.dart';
import 'package:shopp_app/providers/review_provider.dart';

class AdminReviewsPage extends StatefulWidget {
  const AdminReviewsPage({super.key});

  @override
  State<AdminReviewsPage> createState() => _AdminReviewsPageState();
}

class _AdminReviewsPageState extends State<AdminReviewsPage> {
  final TextEditingController _searchController = TextEditingController();
  final List<String> _statusFilters = ['ALL', 'PUBLISHED', 'HIDDEN'];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ReviewProvider>().loadAdminReviews();
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
              final success = await context.read<ReviewProvider>().moderateReview(
                    review.id,
                    status: targetStatus,
                    reason: reasonController.text.trim(),
                  );
              if (context.mounted && success) {
                ScaffoldMessenger.of(context).showSnackBar(
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
    final reviewProvider = context.watch<ReviewProvider>();
    final adminReviews = reviewProvider.adminReviews;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Review Moderation',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => reviewProvider.loadAdminReviews(),
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
                prefixIcon: const Icon(Icons.search, size: 20),
                isDense: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                suffixIcon: _searchController.text.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear, size: 18),
                        onPressed: () {
                          _searchController.clear();
                          reviewProvider.loadAdminReviews(search: '');
                        },
                      )
                    : null,
              ),
              onSubmitted: (query) {
                reviewProvider.loadAdminReviews(search: query);
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
                final isSelected = reviewProvider.adminStatusFilter == status;
                return ChoiceChip(
                  label: Text(status),
                  selected: isSelected,
                  onSelected: (_) {
                    reviewProvider.loadAdminReviews(status: status);
                  },
                );
              },
            ),
          ),
          const Divider(height: 1),

          // Reviews List
          Expanded(
            child: reviewProvider.isLoadingAdminReviews && adminReviews.isEmpty
                ? const Center(child: CircularProgressIndicator())
                : adminReviews.isEmpty
                    ? const Center(
                        child: Text(
                          'No reviews found matching criteria',
                          style: TextStyle(color: Colors.grey),
                        ),
                      )
                    : RefreshIndicator(
                        onRefresh: () => reviewProvider.loadAdminReviews(),
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
                                          return Icon(
                                            starIdx < rev.rating
                                                ? Icons.star
                                                : Icons.star_border,
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
                                        icon: Icon(
                                          isPublished
                                              ? Icons.visibility_off_outlined
                                              : Icons.visibility_outlined,
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
