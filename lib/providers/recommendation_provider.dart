import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:shopp_app/data/models/recommendation_model.dart';
import 'package:shopp_app/data/repositories/recommendation_repository.dart';

class RecommendationProvider extends ChangeNotifier {
  final RecommendationRepository _repository = RecommendationRepository();

  // 1. Personalized Recommendations (Home Page)
  List<RecommendedProduct> _personalized = [];
  String _personalizedReason = 'Recommended for you';
  bool _isLoadingPersonalized = false;
  String? _personalizedError;

  List<RecommendedProduct> get personalized => _personalized;
  String get personalizedReason => _personalizedReason;
  bool get isLoadingPersonalized => _isLoadingPersonalized;
  String? get personalizedError => _personalizedError;

  // 2. Trending Recommendations (Home Page)
  List<RecommendedProduct> _trending = [];
  String _trendingReason = 'Trending now';
  bool _isLoadingTrending = false;
  String? _trendingError;

  List<RecommendedProduct> get trending => _trending;
  String get trendingReason => _trendingReason;
  bool get isLoadingTrending => _isLoadingTrending;
  String? get trendingError => _trendingError;

  // 3. Similar Products (Product Detail Page - keyed by productId)
  final Map<String, List<RecommendedProduct>> _similarMap = {};
  final Map<String, String> _similarReasons = {};
  bool _isLoadingSimilar = false;

  List<RecommendedProduct> getSimilarForProduct(String productId) =>
      _similarMap[productId] ?? [];
  String getSimilarReason(String productId) =>
      _similarReasons[productId] ?? 'Similar to this item';
  bool get isLoadingSimilar => _isLoadingSimilar;

  // 4. Frequently Bought Together (Product Detail Page - keyed by productId)
  final Map<String, List<RecommendedProduct>> _fbtMap = {};
  final Map<String, String> _fbtReasons = {};
  bool _isLoadingFbt = false;

  List<RecommendedProduct> getFbtForProduct(String productId) =>
      _fbtMap[productId] ?? [];
  String getFbtReason(String productId) =>
      _fbtReasons[productId] ?? 'Frequently bought together';
  bool get isLoadingFbt => _isLoadingFbt;

  // --- Fetch Operations ---

  /// Fetch Personalized recommendations for the home screen
  Future<void> fetchPersonalized({int limit = 10, bool force = false}) async {
    if (_personalized.isNotEmpty && !force) return;

    _isLoadingPersonalized = true;
    _personalizedError = null;
    notifyListeners();

    try {
      final res = await _repository.getRecommendations(
        type: 'PERSONALIZED',
        limit: limit,
      );

      if (res.status && res.data is RecommendationResponseModel) {
        final model = res.data as RecommendationResponseModel;
        _personalized = model.items;
        if (model.reason.isNotEmpty) {
          _personalizedReason = model.reason;
        }
      } else {
        _personalizedError = res.message;
      }
    } catch (e) {
      log('RecommendationProvider fetchPersonalized error: $e');
      _personalizedError = e.toString();
    } finally {
      _isLoadingPersonalized = false;
      notifyListeners();
    }
  }

  /// Fetch Trending recommendations for the home screen
  Future<void> fetchTrending({int limit = 10, String? categoryId, bool force = false}) async {
    if (_trending.isNotEmpty && !force && categoryId == null) return;

    _isLoadingTrending = true;
    _trendingError = null;
    notifyListeners();

    try {
      final res = await _repository.getRecommendations(
        type: 'TRENDING',
        limit: limit,
        categoryId: categoryId,
      );

      if (res.status && res.data is RecommendationResponseModel) {
        final model = res.data as RecommendationResponseModel;
        _trending = model.items;
        if (model.reason.isNotEmpty) {
          _trendingReason = model.reason;
        }
      } else {
        _trendingError = res.message;
      }
    } catch (e) {
      log('RecommendationProvider fetchTrending error: $e');
      _trendingError = e.toString();
    } finally {
      _isLoadingTrending = false;
      notifyListeners();
    }
  }

  /// Fetch Similar Products for product details
  Future<void> fetchSimilarProducts(String productId, {int limit = 8}) async {
    if (productId.isEmpty) return;
    if (_similarMap.containsKey(productId) && _similarMap[productId]!.isNotEmpty) {
      return;
    }

    _isLoadingSimilar = true;
    notifyListeners();

    try {
      final res = await _repository.getRecommendations(
        type: 'SIMILAR_PRODUCTS',
        productId: productId,
        limit: limit,
      );

      if (res.status && res.data is RecommendationResponseModel) {
        final model = res.data as RecommendationResponseModel;
        _similarMap[productId] = model.items;
        if (model.reason.isNotEmpty) {
          _similarReasons[productId] = model.reason;
        }
      }
    } catch (e) {
      log('RecommendationProvider fetchSimilarProducts error: $e');
    } finally {
      _isLoadingSimilar = false;
      notifyListeners();
    }
  }

  /// Fetch Frequently Bought Together for product details
  Future<void> fetchFrequentlyBoughtTogether(String productId, {int limit = 4}) async {
    if (productId.isEmpty) return;
    if (_fbtMap.containsKey(productId) && _fbtMap[productId]!.isNotEmpty) {
      return;
    }

    _isLoadingFbt = true;
    notifyListeners();

    try {
      final res = await _repository.getRecommendations(
        type: 'FREQUENTLY_BOUGHT_TOGETHER',
        productId: productId,
        limit: limit,
      );

      if (res.status && res.data is RecommendationResponseModel) {
        final model = res.data as RecommendationResponseModel;
        _fbtMap[productId] = model.items;
        if (model.reason.isNotEmpty) {
          _fbtReasons[productId] = model.reason;
        }
      }
    } catch (e) {
      log('RecommendationProvider fetchFrequentlyBoughtTogether error: $e');
    } finally {
      _isLoadingFbt = false;
      notifyListeners();
    }
  }

  /// Fire-and-forget event tracking for client behavioral signals
  Future<void> recordInteraction({
    required String eventType,
    required String productId,
    String? categoryId,
    Map<String, dynamic>? metadata,
  }) async {
    if (productId.isEmpty) return;
    try {
      await _repository.trackEvent(
        eventType: eventType,
        productId: productId,
        categoryId: categoryId,
        metadata: metadata,
      );
    } catch (e) {
      log('RecommendationProvider recordInteraction warning: $e');
    }
  }

  /// Clear state on logout or refresh
  void clear() {
    _personalized = [];
    _trending = [];
    _similarMap.clear();
    _similarReasons.clear();
    _fbtMap.clear();
    _fbtReasons.clear();
    notifyListeners();
  }
}
