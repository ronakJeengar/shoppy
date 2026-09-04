import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopp_app/data/models/review_model.dart';
import 'package:shopp_app/providers/review_provider.dart';

class WriteReviewDialog extends StatefulWidget {
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
  State<WriteReviewDialog> createState() => _WriteReviewDialogState();
}

class _WriteReviewDialogState extends State<WriteReviewDialog> {
  late int _rating;
  late TextEditingController _titleController;
  late TextEditingController _commentController;
  final _formKey = GlobalKey<FormState>();

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
    final reviewProvider = context.watch<ReviewProvider>();
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
                      icon: Icon(
                        starNum <= _rating ? Icons.star : Icons.star_border,
                        color: Colors.amber,
                        size: 32,
                      ),
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
          onPressed: reviewProvider.isSubmittingReview
              ? null
              : () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
          ),
          onPressed: reviewProvider.isSubmittingReview
              ? null
              : () async {
                  if (!_formKey.currentState!.validate()) return;

                  bool success = false;
                  if (isEditing) {
                    success = await reviewProvider.updateReview(
                      widget.existingReview!.id,
                      widget.productId,
                      rating: _rating,
                      title: _titleController.text.trim(),
                      comment: _commentController.text.trim(),
                    );
                  } else {
                    success = await reviewProvider.submitReview(
                      widget.productId,
                      rating: _rating,
                      title: _titleController.text.trim(),
                      comment: _commentController.text.trim(),
                    );
                  }

                  if (context.mounted) {
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(success
                            ? (isEditing
                                ? 'Review updated successfully!'
                                : 'Review submitted successfully!')
                            : (reviewProvider.reviewsError ??
                                'Failed to submit review')),
                        backgroundColor: success ? Colors.green : Colors.red,
                      ),
                    );
                  }
                },
          child: reviewProvider.isSubmittingReview
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
