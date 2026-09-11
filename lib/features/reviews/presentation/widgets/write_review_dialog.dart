import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shopp_app/core/theme/app_colors.dart';
import 'package:shopp_app/core/theme/app_icons.dart';
import 'package:shopp_app/core/theme/app_radius.dart';
import 'package:shopp_app/core/theme/app_typography.dart';
import 'package:shopp_app/core/widgets/app_icon.dart';
import '../../domain/entities/review_entity.dart';
import 'package:shopp_app/features/reviews/presentation/providers/review_providers.dart';

class WriteReviewDialog extends ConsumerStatefulWidget {
  final String productId;
  final String productName;
  final ReviewEntity? existingReview;

  const WriteReviewDialog({
    super.key,
    required this.productId,
    required this.productName,
    this.existingReview,
  });

  @override
  ConsumerState<WriteReviewDialog> createState() => _WriteReviewDialogState();
}

class _WriteReviewDialogState extends ConsumerState<WriteReviewDialog> {
  late int _rating;
  late TextEditingController _titleController;
  late TextEditingController _commentController;
  final _formKey = GlobalKey<FormState>();
  bool _isSubmitting = false;

  final List<String> _ratingLabels = [
    'Select a rating',
    'Poor (1/5)',
    'Fair (2/5)',
    'Good (3/5)',
    'Very Good (4/5)',
    'Excellent (5/5)',
  ];

  @override
  void initState() {
    super.initState();
    _rating = widget.existingReview?.rating ?? 5;
    _titleController =
        TextEditingController(text: widget.existingReview?.title ?? '');
    _commentController =
        TextEditingController(text: widget.existingReview?.comment ?? '');
  }

  @override
  void dispose() {
    _titleController.dispose();
    _commentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isEditing = widget.existingReview != null;

    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppRadius.lg),
      ),
      title: Text(
        isEditing ? 'Edit Your Review' : 'Write a Review',
        style: AppTypography.titleLarge.copyWith(fontWeight: FontWeight.bold),
      ),
      content: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.productName,
                style: AppTypography.bodySmall.copyWith(
                  color: AppColors.textSecondary,
                  fontWeight: FontWeight.w500,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 16),

              // Star Selector
              Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: List.generate(5, (index) {
                    final starNum = index + 1;
                    return IconButton(
                      icon: AppIcon(
                        starNum <= _rating ? AppIcons.star : AppIcons.starEmpty,
                        color: AppColors.warning,
                        size: 32,
                      ),
                      iconSize: 32,
                      onPressed: () {
                        setState(() {
                          _rating = starNum;
                        });
                      },
                    );
                  }),
                ),
              ),
              Center(
                child: Text(
                  _ratingLabels[_rating],
                  style: AppTypography.labelMedium.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimary,
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Title input
              TextFormField(
                controller: _titleController,
                style: AppTypography.bodyMedium,
                decoration: InputDecoration(
                  labelText: 'Review Title (Optional)',
                  hintText: 'e.g. Great sound quality!',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(AppRadius.sm),
                  ),
                  isDense: true,
                ),
                maxLength: 100,
              ),
              const SizedBox(height: 10),

              // Comment input
              TextFormField(
                controller: _commentController,
                style: AppTypography.bodyMedium,
                decoration: InputDecoration(
                  labelText: 'Your Review *',
                  hintText: 'Tell other shoppers what you liked or disliked...',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(AppRadius.sm),
                  ),
                  alignLabelWithHint: true,
                ),
                maxLines: 4,
                maxLength: 1000,
                validator: (value) {
                  if (value == null || value.trim().length < 3) {
                    return 'Review must be at least 3 characters';
                  }
                  return null;
                },
              ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: _isSubmitting ? null : () => Navigator.pop(context),
          child: Text(
            'Cancel',
            style: AppTypography.labelLarge.copyWith(color: AppColors.textSecondary),
          ),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primary,
            foregroundColor: AppColors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppRadius.sm),
            ),
          ),
          onPressed: _isSubmitting
              ? null
              : () async {
                  if (!_formKey.currentState!.validate()) return;

                  setState(() => _isSubmitting = true);
                  bool success = false;
                  String? errorMsg;

                  if (isEditing) {
                    final res = await ref.read(updateReviewUseCaseProvider)(
                      reviewId: widget.existingReview!.id,
                      rating: _rating,
                      title: _titleController.text.trim(),
                      comment: _commentController.text.trim(),
                    );
                    success = res.isSuccess;
                    if (!success) errorMsg = res.failureOrNull?.message;
                  } else {
                    final res = await ref.read(submitReviewUseCaseProvider)(
                      productId: widget.productId,
                      rating: _rating,
                      title: _titleController.text.trim(),
                      comment: _commentController.text.trim(),
                    );
                    success = res.isSuccess;
                    if (!success) errorMsg = res.failureOrNull?.message;
                  }

                  ref.invalidate(productReviewsProvider(widget.productId));

                  if (context.mounted) {
                    setState(() => _isSubmitting = false);
                    Navigator.pop(context, success);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          success
                              ? (isEditing
                                  ? 'Review updated successfully!'
                                  : 'Review submitted successfully!')
                              : (errorMsg ?? 'Failed to submit review'),
                          style: AppTypography.bodyMedium.copyWith(color: AppColors.white),
                        ),
                        backgroundColor: success ? AppColors.success : AppColors.error,
                      ),
                    );
                  }
                },
          child: _isSubmitting
              ? const SizedBox(
                  width: 18,
                  height: 18,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: AppColors.white,
                  ),
                )
              : Text(
                  isEditing ? 'Update' : 'Submit Review',
                  style: AppTypography.labelLarge.copyWith(
                    color: AppColors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
        ),
      ],
    );
  }
}
