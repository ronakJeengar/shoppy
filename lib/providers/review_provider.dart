import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:shopp_app/data/models/review_model.dart';
import 'package:shopp_app/data/repositories/review_repository.dart';

class ReviewProvider extends ChangeNotifier {
  final ReviewRepository _reviewRepo = ReviewRepository();

  // Public reviews state
  List<ReviewModel> _reviews = [];
  ReviewSummaryModel? _summary;
  bool _isLoadingReviews = false;
  String? _reviewsError;
  int? _selectedRatingFilter;
  String _selectedSort = 'newest';

  // Eligibility state
  ReviewEligibilityModel? _eligibility;
  bool _isCheckingEligibility = false;

  // Review submission state
  bool _isSubmittingReview = false;

  // Admin moderation state
  List<AdminReviewModel> _adminReviews = [];
  bool _isLoadingAdminReviews = false;
  String? _adminReviewsError;
  String _adminStatusFilter = 'ALL';

  // Getters
  List<ReviewModel> get reviews => _reviews;
  ReviewSummaryModel? get summary => _summary;
  bool get isLoadingReviews => _isLoadingReviews;
  String? get reviewsError => _reviewsError;
  int? get selectedRatingFilter => _selectedRatingFilter;
  String get selectedSort => _selectedSort;

  ReviewEligibilityModel? get eligibility => _eligibility;
  bool get isCheckingEligibility => _isCheckingEligibility;
  bool get isSubmittingReview => _isSubmittingReview;

  List<AdminReviewModel> get adminReviews => _adminReviews;
  bool get isLoadingAdminReviews => _isLoadingAdminReviews;
  String? get adminReviewsError => _adminReviewsError;
  String get adminStatusFilter => _adminStatusFilter;

  void setReviewsForTesting({
    List<ReviewModel>? reviews,
    ReviewSummaryModel? summary,
    ReviewEligibilityModel? eligibility,
  }) {
    if (reviews != null) _reviews = reviews;
    if (summary != null) _summary = summary;
    if (eligibility != null) _eligibility = eligibility;
    _isLoadingReviews = false;
    _reviewsError = null;
    notifyListeners();
  }

  void clearState() {
    _reviews = [];
    _summary = null;
    _eligibility = null;
    _isLoadingReviews = false;
    _reviewsError = null;
    _selectedRatingFilter = null;
    _selectedSort = 'newest';
    _isSubmittingReview = false;
    _isCheckingEligibility = false;
    notifyListeners();
  }

  // 1. Load Reviews & Summary
  Future<void> loadProductReviews(
    String productId, {
    int? rating,
    String? sort,
  }) async {
    if (rating != null) {
      _selectedRatingFilter = rating == 0 ? null : rating;
    }
    if (sort != null) {
      _selectedSort = sort;
    }

    _isLoadingReviews = true;
    _reviewsError = null;
    notifyListeners();

    try {
      final response = await _reviewRepo.getProductReviews(
        productId,
        page: 1,
        limit: 20,
        rating: _selectedRatingFilter,
        sort: _selectedSort,
      );

      if (response.status && response.data is Map<String, dynamic>) {
        final data = response.data as Map<String, dynamic>;
        _reviews = data['reviews'] as List<ReviewModel>;
        _summary = data['summary'] as ReviewSummaryModel;
      } else {
        _reviewsError = response.message;
      }
    } catch (e) {
      log('ReviewProvider loadProductReviews error: $e');
      _reviewsError = 'Failed to load reviews';
    } finally {
      _isLoadingReviews = false;
      notifyListeners();
    }
  }

  // 2. Check Eligibility
  Future<void> checkEligibility(String productId) async {
    _isCheckingEligibility = true;
    notifyListeners();

    try {
      final response = await _reviewRepo.getReviewEligibility(productId);
      if (response.status && response.data is ReviewEligibilityModel) {
        _eligibility = response.data as ReviewEligibilityModel;
      } else {
        _eligibility = ReviewEligibilityModel(
          canReview: false,
          hasReviewed: false,
          isVerifiedPurchase: false,
          reason: response.message,
        );
      }
    } catch (e) {
      log('ReviewProvider checkEligibility error: $e');
      _eligibility = null;
    } finally {
      _isCheckingEligibility = false;
      notifyListeners();
    }
  }

  // 3. Submit Review
  Future<bool> submitReview(
    String productId, {
    required int rating,
    String? title,
    required String comment,
  }) async {
    _isSubmittingReview = true;
    notifyListeners();

    try {
      final response = await _reviewRepo.createReview(
        productId,
        rating: rating,
        title: title,
        comment: comment,
      );

      if (response.status && response.data is ReviewModel) {
        await loadProductReviews(productId);
        await checkEligibility(productId);
        return true;
      }
      return false;
    } catch (e) {
      log('ReviewProvider submitReview error: $e');
      return false;
    } finally {
      _isSubmittingReview = false;
      notifyListeners();
    }
  }

  // 4. Update Review
  Future<bool> updateReview(
    String reviewId,
    String productId, {
    int? rating,
    String? title,
    String? comment,
  }) async {
    _isSubmittingReview = true;
    notifyListeners();

    try {
      final response = await _reviewRepo.updateReview(
        reviewId,
        rating: rating,
        title: title,
        comment: comment,
      );

      if (response.status) {
        await loadProductReviews(productId);
        await checkEligibility(productId);
        return true;
      }
      return false;
    } catch (e) {
      log('ReviewProvider updateReview error: $e');
      return false;
    } finally {
      _isSubmittingReview = false;
      notifyListeners();
    }
  }

  // 5. Delete Review
  Future<bool> deleteReview(String reviewId, String productId) async {
    try {
      final response = await _reviewRepo.deleteReview(reviewId);
      if (response.status) {
        await loadProductReviews(productId);
        await checkEligibility(productId);
        return true;
      }
      return false;
    } catch (e) {
      log('ReviewProvider deleteReview error: $e');
      return false;
    }
  }

  // 6. Admin Review Moderation
  Future<void> loadAdminReviews({String? status, String? search}) async {
    if (status != null) _adminStatusFilter = status;

    _isLoadingAdminReviews = true;
    _adminReviewsError = null;
    notifyListeners();

    try {
      final response = await _reviewRepo.getAdminReviews(
        page: 1,
        limit: 50,
        status: _adminStatusFilter,
        search: search,
      );

      if (response.status && response.data is List<AdminReviewModel>) {
        _adminReviews = response.data as List<AdminReviewModel>;
      } else {
        _adminReviewsError = response.message;
      }
    } catch (e) {
      log('ReviewProvider loadAdminReviews error: $e');
      _adminReviewsError = 'Failed to load reviews for moderation';
    } finally {
      _isLoadingAdminReviews = false;
      notifyListeners();
    }
  }

  Future<bool> moderateReview(
    String reviewId, {
    required String status,
    String? reason,
  }) async {
    try {
      final response = await _reviewRepo.updateAdminReviewStatus(
        reviewId,
        status: status,
        reason: reason,
      );

      if (response.status) {
        final idx = _adminReviews.indexWhere((r) => r.id == reviewId);
        if (idx != -1) {
          _adminReviews[idx] = _adminReviews[idx].copyWith(status: status);
          notifyListeners();
        }
        return true;
      }
      return false;
    } catch (e) {
      log('ReviewProvider moderateReview error: $e');
      return false;
    }
  }
}
