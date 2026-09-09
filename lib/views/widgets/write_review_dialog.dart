import 'package:flutter/material.dart';
import 'package:shopp_app/core/theme/app_icons.dart';
import 'package:shopp_app/core/widgets/app_icon.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shopp_app/data/models/review_model.dart';
import 'package:shopp_app/features/reviews/presentation/providers/review_providers.dart';

class WriteReviewDialog extends ConsumerStatefulWidget {
  final String productId;
  final String productName;
  final ReviewModel? existingReview;

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
      title: Text(
        isEditing ? 'Edit Your Review' : 'Write a Review',
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
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
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.grey.shade700,
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
                        color: Colors.amber,
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
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey.shade800,
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Title input
              TextFormField(
                controller: _titleController,
                decoration: const InputDecoration(
                  labelText: 'Review Title (Optional)',
                  hintText: 'e.g. Great sound quality!',
                  border: OutlineInputBorder(),
                  isDense: true,
                ),
                maxLength: 100,
              ),
              const SizedBox(height: 10),

              // Comment input
              TextFormField(
                controller: _commentController,
                decoration: const InputDecoration(
                  labelText: 'Your Review *',
                  hintText: 'Tell other shoppers what you liked or disliked...',
                  border: OutlineInputBorder(),
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
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
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
                        content: Text(success
                            ? (isEditing
                                ? 'Review updated successfully!'
                                : 'Review submitted successfully!')
                            : (errorMsg ?? 'Failed to submit review')),
                        backgroundColor: success ? Colors.green : Colors.red,
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
                    color: Colors.white,
                  ),
                )
              : Text(isEditing ? 'Update' : 'Submit Review'),
        ),
      ],
    );
  }
}
